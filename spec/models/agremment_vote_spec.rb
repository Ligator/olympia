# == Schema Information
#
# Table name: agremment_votes
#
#  id            :bigint           not null, primary key
#  agremments_id :bigint           not null
#  proposals_id  :bigint           not null
#  users_id      :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

RSpec.describe AgremmentVote, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
