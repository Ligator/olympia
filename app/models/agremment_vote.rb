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
class AgremmentVote < ApplicationRecord
  belongs_to :agremments
  belongs_to :proposals
  belongs_to :users
end
