FactoryBot.define do
  factory :order_item do
    order { nil }
    product { nil }
    name { "MyString" }
    description { "MyText" }
    price_in_cents { 1 }
    quantity { 1 }
    size { "MyString" }
  end
end
