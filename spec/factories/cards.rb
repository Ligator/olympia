FactoryBot.define do
  factory :card do
    number_card { 1 }
    name_bank { "MyString" }
    titular_name { "MyString" }
    expiration_date { "2021-03-05" }
    type { "" }
    user { nil }
  end
end
