namespace :fetch do
  desc "愛知県の神社データを保存"
  task shrines_aichi: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_code = 'aichi'
    prefecture_name = '愛知県'

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_code, prefecture_name)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end

  desc "岐阜県の神社データを保存"
  task shrines_gifu: :environment do
    api_key = ENV['PLACES_API_KEY']
    prefecture_code = 'gifu'
    prefecture_name = '岐阜県'

    fetch_shrines_data_prefecture = FetchShrinesDataPrefecture.new(api_key, prefecture_code, prefecture_name)
    fetch_shrines_data_prefecture.fetch_and_save

    puts "#{prefecture_name}の神社データの取得と保存が完了しました！"
  end
end
