class Order < ApplicationRecord
  belongs_to :user
  belongs_to :store

  scope :pending, -> { where(state: "pending") }
end
