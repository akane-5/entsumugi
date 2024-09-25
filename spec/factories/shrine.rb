FactoryBot.define do
  factory :shrine do
    name { "#{Faker::Name.name}神社" }
    address { Faker::Address.full_address }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    place_id { Faker::Internet.uuid }
    photo_reference { Faker::Internet.url }
    website { Faker::Internet.url }
    prefecture # prefectureのファクトリを関連付け
  end
end
