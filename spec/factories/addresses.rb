FactoryBot.define do
  factory :address do
    street { "MyString" }
    number { "MyString" }
    colony { "MyString" }
    postal_code { "MyString" }
    city { "MyString" }
    state { "MyString" }
    user { nil }
  end
end
