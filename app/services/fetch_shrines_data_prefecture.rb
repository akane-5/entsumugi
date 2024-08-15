require 'google_places'

class FetchShrinesDataPrefecture
  #GooglePlacesAPIのクライアント神社名のリストを初期化
  def initialize(api_key, prefecture_name, center_latitude, center_longitude, radius)
    @client = GooglePlaces::Client.new(api_key)
    @prefecture_id = Prefecture.find_by(name:prefecture_name).id
    @prefecture_name = prefecture_name
    @center_latitude = center_latitude
    @center_longitude = center_longitude
    @radius = radius
  end

  #神社データの取得とDBへの保存
  def fetch_and_save
      results = fetch_shrine_data
      save_to_db(results)
  end

  private

  #GooglePlacesAPIを使ってデータを取得
  def fetch_shrine_data
    @client.spots_by_query("神社 #{@prefecture_name}", types: ['shrine'], location: "#{@center_latitude},#{@center_longitude}", radius: @radius, rankby: 'prominence', max: 30, language: 'ja')
  end

  #取得したデータをDBに保存
  def save_to_db(results)
    results.each do |result|
      next unless result.formatted_address.include?(@prefecture_name) #指定した都道府県の神社だけを保存する
      begin
        Shrine.create!(
          name: result.name,
          address: result.formatted_address.presence || "住所情報なし",
          latitude: result.lat,
          longitude: result.lng,
          place_id: result.place_id,
          website: result.website,
          photo_reference: extract_photos(result).to_json, #URLを生成してJSON形式で保存
          prefecture_id: @prefecture_id
        )
      rescue ActiveRecord::RecordInvalid => e
        Rails.logger.error "Failed to save shrine: #{e.message}" #エラーメッセージをログに出力
      end
    end
  end

  #max３枚の写真をURLに変換
  def extract_photos(result)
    photo_references = result.photos.take(3).map(&:photo_reference) #最大3枚のphoto_referenceを取得
    photo_references.map { |ref| "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{ref}&key=#{ENV['PLACES_API_KEY']}" }
  end
end
