namespace :fetch do
  desc '大阪府の神社データを保存'
  task shrines_osaka: :environment do
    api_key = ENV.fetch('PLACES_API_KEY')
    prefecture_name = '大阪府'
    center_latitude = 34.686317 # 緯度
    center_longitude = 135.519219 # 経度
    radius = 50_000 # 半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc '京都府の神社データを保存'
  task shrines_kyoto: :environment do
    api_key = ENV.fetch('PLACES_API_KEY')
    prefecture_name = '京都府'
    center_latitude = 35.011636 # 緯度
    center_longitude = 135.768029 # 経度
    radius = 50_000 # 半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc '滋賀県の神社データを保存'
  task shrines_shiga: :environment do
    api_key = ENV.fetch('PLACES_API_KEY')
    prefecture_name = '滋賀県'
    center_latitude = 35.004444 # 緯度
    center_longitude = 135.868476 # 経度
    radius = 50_000 # 半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc '兵庫県の神社データを保存'
  task shrines_hyogo: :environment do
    api_key = ENV.fetch('PLACES_API_KEY')
    prefecture_name = '兵庫県'
    center_latitude = 34.691298 # 緯度
    center_longitude = 135.183035 # 経度
    radius = 50_000 # 半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc '奈良県の神社データを保存'
  task shrines_nara: :environment do
    api_key = ENV.fetch('PLACES_API_KEY')
    prefecture_name = '奈良県'
    center_latitude = 34.685556 # 緯度
    center_longitude = 135.839203 # 経度
    radius = 50_000 # 半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc '和歌山県の神社データを保存'
  task shrines_wakayama: :environment do
    api_key = ENV.fetch('PLACES_API_KEY')
    prefecture_name = '和歌山県'
    center_latitude = 33.622276 # 緯度
    center_longitude = 135.167503 # 経度
    radius = 50_000 # 半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end
end
