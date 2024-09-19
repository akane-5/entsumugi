require 'google/cloud/storage'
require 'open-uri'

class StoreShrinePhotos
  def initialize(batch_size = 30)
    @storage = Google::Cloud::Storage.new(
      project_id: 'entsumugi',
      credentials: Rails.root.join('config', 'entsumugi-ad2a8ad02b60.json').to_s
    )
    @bucket = @storage.bucket('entsumugi')
    @api_key = ENV['PLACES_API_KEY'] # 環境変数にAPIキーが設定されていることを想定
    @batch_size = batch_size
  end

  def process_single_shrine
    # 最初の1件だけを取得
    shrines = Shrine.where('photo_reference IS NULL OR photo_reference = ? OR photo_reference = ?', '', '[]').limit(@batch_size)
    shrines.each do |shrine|
      next if shrine.place_id.blank? # place_idがない場合はスキップ

      begin
        # Google Places APIを使って写真データを取得
        photo_references = fetch_photo_references(shrine.place_id)
        stored_urls = []

        # 最初の1枚だけ保存
        if photo_references.any?
          ref = photo_references.first
          file_name = "#{SecureRandom.uuid}.jpg"
          photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{ref}&key=#{@api_key}"

          # 写真をダウンロードしてGoogle Cloud Storageにアップロード
          begin
            # open-uriを使用して画像をダウンロード
            URI.open(photo_url) do |image|
              @bucket.create_file(image, file_name)
              stored_urls << @bucket.file(file_name).public_url
            end
          rescue => e
            Rails.logger.error "Failed to download image from #{photo_url}: #{e.message}"
          end
        end

        # 保存された写真URLをDBに更新（photo_referenceのカラムに保存）
        shrine.update(photo_reference: stored_urls.to_json)

      rescue => e
        Rails.logger.error "Error processing shrine #{shrine.id}: #{e.message}"
      end
    end
  end

  private

  # Google Places APIでplace_idからphoto_referenceを取得
  def fetch_photo_references(place_id)
    uri = URI("https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place_id}&key=#{@api_key}")
    response = Net::HTTP.get_response(uri)
    if response.is_a?(Net::HTTPSuccess)
      data = JSON.parse(response.body)
      if data['result'] && data['result']['photos']
        return data['result']['photos'].map { |photo| photo['photo_reference'] }
      end
    else
      Rails.logger.error "Failed to fetch place details for place_id #{place_id}: #{response.message}"
    end
    []
  end
end
