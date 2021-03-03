class Product < ApplicationRecord
  has_many_attached :images, dependent: :destroy
  belongs_to :store
  has_many :comments

  scope :with_inventory, -> { where("quantity > ?", 0) }

  def price
    (price_in_cents / 100.0).to_d
  end
end
