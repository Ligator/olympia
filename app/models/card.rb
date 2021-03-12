# == Schema Information
#
# Table name: cards
#
#  id              :bigint           not null, primary key
#  number_card     :string
#  name_bank       :string
#  titular_name    :string
#  expiration_date :date
#  type            :string
#  user_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Card < ApplicationRecord
  belongs_to :user
  validates_presence_of :number_card, :name_bank, :titular_name
end
