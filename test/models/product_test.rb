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
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
