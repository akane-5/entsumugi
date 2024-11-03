FactoryBot.define do
  factory :shrine_category do
    association :shrine
    association :category
  end
end
