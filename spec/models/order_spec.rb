# == Schema Information
#
# Table name: orders
#
#  id              :bigint           not null, primary key
#  user_id         :bigint
#  amount_in_cents :integer
#  state           :string           default("pending")
#  payment_method  :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  stripe_session  :string
#
require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
