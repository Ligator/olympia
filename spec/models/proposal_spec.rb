# == Schema Information
#
# Table name: proposals
#
#  id               :bigint           not null, primary key
#  body             :string
#  votes_count      :integer
#  votes_porcentage :decimal(, )
#  users_id         :bigint           not null
#  agremments_id    :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'rails_helper'

RSpec.describe Proposal, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
