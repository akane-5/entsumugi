namespace :fetch do
  desc "Fetch shrines data for Aichi"
  task shrines_aichi: :environment do
    FetchShrinesData.new(ENV['PLACES_API_KEY']).fetch_and_save_shrines('愛知県')
  end

  desc "Fetch shrines data for Gifu"
  task shrines_gifu: :environment do
    FetchShrinesData.new(ENV['PLACES_API_KEY']).fetch_and_save_shrines('岐阜県')
  end

  desc "Fetch shrines data for Mie"
  task shrines_mie: :environment do
    FetchShrinesData.new(ENV['PLACES_API_KEY']).fetch_and_save_shrines('三重県')
  end
end
