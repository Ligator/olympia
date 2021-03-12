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
require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
