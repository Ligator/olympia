# == Schema Information
#
# Table name: order_items
#
#  id             :bigint           not null, primary key
#  order_id       :bigint           not null
#  product_id     :bigint
#  name           :string
#  description    :text
#  price_in_cents :integer
#  quantity       :integer
#  size           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
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
