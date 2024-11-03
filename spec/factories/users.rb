FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    sequence(:uid) { |n| "user_uid_#{n}" } # ユニークなUIDを生成
  end
end
