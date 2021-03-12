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
class Proposal < ApplicationRecord
  belongs_to :users
  belongs_to :agremments
end
