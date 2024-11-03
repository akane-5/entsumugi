FactoryBot.define do
  factory :shrine do
    association :prefecture # prefectureのファクトリを関連付け
    name { "#{Faker::Name.name}神社" }
    address { Faker::Address.full_address }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    place_id { Faker::Internet.uuid }
    photo_reference { Faker::Internet.url }
    website { Faker::Internet.url }
  end
end
