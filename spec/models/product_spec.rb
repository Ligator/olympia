# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  name           :string
#  description    :string
#  price_in_cents :integer
#  size           :string
#  quantity       :integer
#  store_id       :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  weight         :integer
#  height         :integer
#  width          :integer
#  length         :integer
#  delivery_cost  :integer
#
require 'rails_helper'

RSpec.describe Product, type: :model do
  it "creates a new product" do
    user = FactoryBot.create(:user)
    store = FactoryBot.create(:store, user: user)
    expect {
      product = Product.new(store: store)
      product.save
    }.to change { Product.count }.by(1)
  end
end
