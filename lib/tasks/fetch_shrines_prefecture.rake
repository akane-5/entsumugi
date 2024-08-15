namespace :fetch do
  desc "愛知県の神社データを保存"
  task shrines_aichi: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '愛知県'
    center_latitude = 35.1802 #緯度
    center_longitude = 136.9066 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "岐阜県の神社データを保存"
  task shrines_gifu: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '岐阜県'
    center_latitude = 35.3912 #緯度
    center_longitude = 136.7223 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "三重県の神社データを保存"
  task shrines_mie: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '三重県'
    center_latitude = 34.7303 #緯度
    center_longitude = 136.5086 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "静岡県の神社データを保存"
  task shrines_shizuoka: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '静岡県'
    center_latitude = 34.9769 #緯度
    center_longitude = 138.3831 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end
end
