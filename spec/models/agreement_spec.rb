# == Schema Information
#
# Table name: agreements
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  state       :string
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Agreement, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
