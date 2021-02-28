FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "myemail#{n}@example.com" }
    password  { "12345678" }
  end
end
