require 'google_places'

class FetchShrinesData
  def initialize(api_key)
    @client = GooglePlaces::Client.new(api_key)
  end

  def fetch_and_save_shrines(location)
    next_page_token = nil

    loop do
      response = fetch_spots(location, next_page_token)
      spots = response[:spots]
      save_spots(spots)

      next_page_token = response[:next_page_token]
      puts "Next page token: #{next_page_token}" # デバッグ用ログ
      break unless next_page_token
      sleep(5) # Google Places APIのレートリミットを避けるためのスリープ
    end
  end

  private

  def fetch_spots(location, page_token = nil)
    response = @client.spots_by_query("神社 #{location}", page_token: page_token, types: ['shrine'], language: 'ja', rankby: 'prominence')
    puts response.inspect # レスポンス全体をログ出力
    {
      spots: response,
      next_page_token: response.instance_variable_get("@next_page_token")
    }
  end

  def save_spots(spots)
    spots.each do |spot|
      shrine = Shrine.find_or_initialize_by(place_id: spot.place_id)
      shrine.name = spot.name
      shrine.address = spot.vicinity || spot.formatted_address || "住所情報なし"
      shrine.prefecture_id ||= 23
      shrine.latitude = spot.lat
      shrine.longitude = spot.lng
      shrine.website = spot.website

      if spot.photos.any?
        photo_references = spot.photos.take(3).map(&:photo_reference)
        photo_urls = photo_references.map { |ref| "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{ref}&key=#{ENV['PLACES_API_KEY']}" }
        shrine.photo_reference = photo_urls.to_json
      end

      if shrine.save
        puts "「#{shrine.name}」を保存しました"
      else
        puts "「#{spot.name}」の保存に失敗しました: #{shrine.errors.full_messages.join(', ')}"
      end
    end
  end
end
