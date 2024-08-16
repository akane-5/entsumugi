namespace :fetch do
  desc "鳥取県の神社データを保存"
  task shrines_tottori: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '鳥取県'
    center_latitude = 35.482208 #緯度
    center_longitude = 134.228145 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "岡山県の神社データを保存"
  task shrines_okayama: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '岡山県'
    center_latitude = 34.661776 #緯度
    center_longitude = 133.935157 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "島根県の神社データを保存"
  task shrines_shimane: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '島根県'
    center_latitude = 35.472290 #緯度
    center_longitude = 133.050525 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "広島県の神社データを保存"
  task shrines_hiroshima: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '広島県'
    center_latitude = 34.396219 #緯度
    center_longitude = 132.459334 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "山口県の神社データを保存"
  task shrines_yamaguchi: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '山口県'
    center_latitude = 34.185898 #緯度
    center_longitude = 131.471103 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end
end
