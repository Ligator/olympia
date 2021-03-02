class Order < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_many :order_items

  scope :pending, -> { where(state: "pending") }
  scope :paid, -> { where(state: "paid") }
end
