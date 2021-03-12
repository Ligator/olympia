# == Schema Information
#
# Table name: addresses
#
#  id          :bigint           not null, primary key
#  street      :string
#  number      :string
#  colony      :string
#  postal_code :string
#  city        :string
#  state       :string
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Address < ApplicationRecord
  belongs_to :user
end
