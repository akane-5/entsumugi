FactoryBot.define do
  factory :bookmark do
    association :user
    association :shrine
  end
end
