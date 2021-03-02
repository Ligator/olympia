class Product < ApplicationRecord
  has_many_attached :images, dependent: :destroy
  belongs_to :store
  has_many :comments
end
