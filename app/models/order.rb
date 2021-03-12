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
