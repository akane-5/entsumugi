FactoryBot.define do
  factory :post do
    user #userのファクトリを関連付け
    shrine #shrineのファクトリを関連付け
    body { Faker::Lorem.paragraph }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test_image.png'), 'image/png') } #テスト用ファイル
  end
end
