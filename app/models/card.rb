class Card < ApplicationRecord
  belongs_to :user
  validates_presence_of :number_card, :name_bank, :titular_name
end
