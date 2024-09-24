FactoryBot.define do
  factory :prefecture do
    name { Faker::Address.state }
  end
end
