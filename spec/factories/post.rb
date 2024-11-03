FactoryBot.define do
  factory :post do
    association :user #userのファクトリを関連付け
    association :shrine #shrineのファクトリを関連付け
    body { Faker::Lorem.paragraph }

    # テスト用画像ファイルを自動で添付
    after(:build) do |post|
      post.image.attach(
        io: Rails.root.join('spec/fixtures/files/test_image.png').open,
        filename: 'test_image.png',
        content_type: 'image/png'
      )
    end
  end
end
