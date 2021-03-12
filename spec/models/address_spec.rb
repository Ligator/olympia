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
require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
