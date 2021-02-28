FactoryBot.define do
  factory :order do
    store { nil }
    user_id { 1 }
    amount_in_cents { 1 }
    state { "MyString" }
    payment_method { "MyString" }
  end
end
