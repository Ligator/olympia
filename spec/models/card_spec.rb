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
require 'rails_helper'

RSpec.describe Card, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
