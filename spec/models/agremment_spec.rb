# == Schema Information
#
# Table name: agremments
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  state       :text
#  users_id    :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Agremment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
