namespace :fetch do
  desc "石川県の神社データを保存"
  task shrines_ishikawa: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '石川県'
    center_latitude = 36.594433 #緯度
    center_longitude = 136.625571 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "福井県の神社データを保存"
  task shrines_fukui: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '福井県'
    center_latitude = 36.065218 #緯度
    center_longitude = 136.221742 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "富山県の神社データを保存"
  task shrines_toyama: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '富山県'
    center_latitude = 36.695321 #緯度
    center_longitude = 137.211396 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "新潟県の神社データを保存"
  task shrines_niigata: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '新潟県'
    center_latitude = 37.902477 #緯度
    center_longitude = 138.252924 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "長野県の神社データを保存"
  task shrines_nagano: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '長野県'
    center_latitude = 36.651303 #緯度
    center_longitude = 138.181062 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "山梨県の神社データを保存"
  task shrines_yamanashi: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_name = '山梨県'
    center_latitude = 35.663826 #緯度
    center_longitude = 138.568444 #経度
    radius = 50000 #半径50kmの例

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_name, center_latitude, center_longitude, radius)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end
end
