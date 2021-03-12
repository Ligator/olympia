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
FactoryBot.define do
  factory :proposal do
    body { "MyString" }
    votes_count { 1 }
    votes_porcentage { "9.99" }
    users { nil }
    agremments { nil }
  end
end
