namespace :fetch do
  desc "福岡県の神社データを保存"
  task shrines_fukuoka: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '福岡県'
    center_latitude = 33.6064 #緯度
    center_longitude = 130.4181 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "長崎県の神社データを保存"
  task shrines_nagasaki: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '長崎県'
    center_latitude = 32.7503 #緯度
    center_longitude = 129.8777 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "佐賀県の神社データを保存"
  task shrines_saga: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '佐賀県'
    center_latitude = 33.2634 #緯度
    center_longitude = 130.2998 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "大分県の神社データを保存"
  task shrines_oita: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '大分県'
    center_latitude = 33.2382 #緯度
    center_longitude = 131.6126 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "熊本県の神社データを保存"
  task shrines_kumamoto: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '熊本県'
    center_latitude = 32.7894 #緯度
    center_longitude = 130.7411 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "宮崎県の神社データを保存"
  task shrines_miyazaki: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '宮崎県'
    center_latitude = 31.9111 #緯度
    center_longitude = 131.4239 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "鹿児島県の神社データを保存"
  task shrines_kagoshima: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '鹿児島県'
    center_latitude = 31.5602 #緯度
    center_longitude = 130.5571 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "沖縄県の神社データを保存"
  task shrines_okinawa: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '沖縄県'
    center_latitude = 26.5123 #緯度
    center_longitude = 127.9999 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end
end
