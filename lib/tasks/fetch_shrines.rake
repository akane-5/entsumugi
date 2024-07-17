namespace :fetch do
  desc "Google Places APIから神社データを取得"
  task shrines: :environment do
    FetchShrinesData.new.fetch_and_save_shrines
  end
end