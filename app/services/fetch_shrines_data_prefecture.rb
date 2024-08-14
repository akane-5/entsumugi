require 'yaml'
require 'google_places'

class FetchShrinesDataPrefecture
  #GooglePlacesAPIのクライアント神社名のリストを初期化
  def initialize(api_key, prefecture_code, prefecture_name)
    @client = GooglePlaces::Client.new(api_key)
    @shrine_names = load_shrine_names(prefecture_code)
    @prefecture_id = Prefecture.find_by(name:prefecture_name).id
  end

  #神社データの取得とDBへの保存
  def fetch_and_save
    @shrine_names.each do |shrine_name|
      results = fetch_shrine_data(shrine_name, @prefecture_name)
      save_to_db(results)
    end
  end

  private

  #YAMLファイルから神社名を読み込み
  def load_shrine_names(prefecture_code)
    YAML.load_file("config/shrines/#{prefecture_code}.yml")['shrines']
  end

  #GooglePlacesAPIを使ってデータを取得
  def fetch_shrine_data(shrine_name, prefecture_name)
    query = "神社 御朱印 #{shrine_name} #{prefecture_name}"
    @client.spots_by_query(query, language: 'ja')
  end

  #取得したデータをDBに保存
  def save_to_db(results)
    results.each do |result|
      next unless result.formatted_address.include?("岐阜県") #岐阜県の神社だけを保存する
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
