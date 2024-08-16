namespace :fetch do
  desc "愛媛県の神社データを保存"
  task shrines_ehime: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '愛媛県'
    center_latitude = 33.841665 #緯度
    center_longitude = 132.766121 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "香川県の神社データを保存"
  task shrines_kagawa: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '香川県'
    center_latitude = 34.340669 #緯度
    center_longitude = 134.043444 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "徳島県の神社データを保存"
  task shrines_tokushima: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '徳島県'
    center_latitude = 34.065705 #緯度
    center_longitude = 134.559455 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "高知県の神社データを保存"
  task shrines_kochi: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '高知県'
    center_latitude = 33.559700 #緯度
    center_longitude = 133.531080 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end
end
