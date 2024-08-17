namespace :fetch do
  desc '東京都の神社データを保存'
  task shrines_tokyo: :environment do
    api_key = ENV.fetch('PLACES_API_KEY')
    prefecture_name = '東京都'
    center_latitude = 35.682839 # 緯度
    center_longitude = 139.759455 # 経度
    radius = 50_000 # 半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc '千葉県の神社データを保存'
  task shrines_chiba: :environment do
    api_key = ENV.fetch('PLACES_API_KEY')
    prefecture_name = '千葉県'
    center_latitude = 35.607566 # 緯度
    center_longitude = 140.106202 # 経度
    radius = 50_000 # 半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc '神奈川県の神社データを保存'
  task shrines_kanagawa: :environment do
    api_key = ENV.fetch('PLACES_API_KEY')
    prefecture_name = '神奈川県'
    center_latitude = 35.447507 # 緯度
    center_longitude = 139.642857 # 経度
    radius = 50_000 # 半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc '埼玉県の神社データを保存'
  task shrines_saitama: :environment do
    api_key = ENV.fetch('PLACES_API_KEY')
    prefecture_name = '埼玉県'
    center_latitude = 35.856999 # 緯度
    center_longitude = 139.648946 # 経度
    radius = 50_000 # 半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc '栃木県の神社データを保存'
  task shrines_tochigi: :environment do
    api_key = ENV.fetch('PLACES_API_KEY')
    prefecture_name = '栃木県'
    center_latitude = 36.565346 # 緯度
    center_longitude = 139.883565 # 経度
    radius = 50_000 # 半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc '群馬県の神社データを保存'
  task shrines_gunma: :environment do
    api_key = ENV.fetch('PLACES_API_KEY')
    prefecture_name = '群馬県'
    center_latitude = 36.391208 # 緯度
    center_longitude = 139.060949 # 経度
    radius = 50_000 # 半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc '茨城県の神社データを保存'
  task shrines_ibaragi: :environment do
    api_key = ENV.fetch('PLACES_API_KEY')
    prefecture_name = '茨城県'
    center_latitude = 36.341812 # 緯度
    center_longitude = 140.446000 # 経度
    radius = 50_000 # 半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end
end
