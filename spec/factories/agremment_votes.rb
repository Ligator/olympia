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
FactoryBot.define do
  factory :agremment_vote do
    agremments { nil }
    proposals { nil }
    users { nil }
  end
end
