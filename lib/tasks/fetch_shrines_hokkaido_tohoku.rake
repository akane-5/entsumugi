namespace :fetch do
  desc "北海道の神社データを保存"
  task shrines_hokkaido: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '北海道'
    center_latitude = 43.06417 #緯度
    center_longitude = 141.34694 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "青森県の神社データを保存"
  task shrines_aomori: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '青森県'
    center_latitude = 40.82444 #緯度
    center_longitude = 140.74000 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "秋田県の神社データを保存"
  task shrines_akita: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '秋田県'
    center_latitude = 39.71861 #緯度
    center_longitude = 140.10250 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "岩手県の神社データを保存"
  task shrines_iwate: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '岩手県'
    center_latitude = 39.70361 #緯度
    center_longitude = 141.15250 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "山形県の神社データを保存"
  task shrines_yamagata: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '山形県'
    center_latitude = 38.24056 #緯度
    center_longitude = 140.36333 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "宮城県の神社データを保存"
  task shrines_miyagi: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '宮城県'
    center_latitude = 38.26889 #緯度
    center_longitude = 140.87194 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "福島県の神社データを保存"
  task shrines_fukushima: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '福島県'
    center_latitude = 37.75000 #緯度
    center_longitude = 140.46778 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end
end