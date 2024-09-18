require 'csv'

namespace :import do
  desc "Import shrine categories from CSV file"
  task shrine_categories: :environment do
    csv_file_path = Rails.root.join('config', 'shrine_categories_data_production.csv')

    CSV.foreach(csv_file_path, headers: true) do |row|
      ShrineCategory.create!(
        shrine_id: row['shrine_id'],
        category_id: row['category_id']
      )
    end

    puts "Import completed!"
  end
end