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
