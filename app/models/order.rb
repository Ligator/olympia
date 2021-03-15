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
class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_items, dependent: :destroy

  scope :pending, -> { where(state: "pending") }
  scope :paid, -> { where(state: "paid") }

  def pending?
    state == "pending"
  end

  def paid?
    state == "paid"
  end
end
