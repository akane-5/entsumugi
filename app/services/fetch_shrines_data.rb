require 'google_places'

class FetchShrinesData
  REGIONS = {
    hokkaido: { lat: 43.06417, lng: 141.34694, name: '北海道' },
    tohoku:   { lat: 38.26889, lng: 140.86917, name: '東北地方' },
    kanto:    { lat: 35.68944, lng: 139.69167, name: '関東地方' },
    chubu:    { lat: 36.65139, lng: 138.18111, name: '中部地方' },
    kinki:    { lat: 34.68639, lng: 135.52, name: '近畿地方' },
    chugoku:  { lat: 34.39639, lng: 132.45944, name: '中国地方' },
    shikoku:  { lat: 34.06583, lng: 134.55944, name: '四国地方' },
    kyushu:   { lat: 33.59028, lng: 130.40167, name: '九州地方' }
  }

  def initialize
    @client = GooglePlaces::Client.new(ENV['PLACES_API_KEY'])
  end

  def fetch_and_save_shrines
    query = '御朱印 神社'
    language = 'ja'
    radius = 50000 # 半径50km

    REGIONS.each do |key, region|
      puts "Fetching data for #{region[:name]}"
      fetch_spots(region[:lat], region[:lng], query, language, radius)
    end
  end

  private

  def fetch_spots(lat, lng, query, language, radius)
    spots = @client.spots(lat, lng, radius: radius, language: language, types: ['shrine'])
    save_spots(spots)

    # ページネーションの処理
    while spots.next_page_token do
      sleep 2 # 次のリクエストまで少し待つ
      spots = @client.spots(lat, lng, radius: radius, language: language, types: ['shrine'], page_token: spots.next_page_token)
      save_spots(spots)
    end
  end

  def save_spots(spots)
    spots.each do |spot|
      shrine = Shrine.find_or_initialize_by(place_id: spot.place_id)
      shrine.name = spot.name
      shrine.address = spot.vicinity
      shrine.latitude = spot.lat
      shrine.longitude = spot.lng
      shrine.photo_url = spot.photos.first.photo_url if spot.photos.any?

      if shrine.save
        puts "「#{shrine.name}」を保存しました"
      else
        puts "「#{spot.name}」の保存に失敗しました: #{shrine.errors.full_messages.join(', ')}"
      end
    end
  end
end
