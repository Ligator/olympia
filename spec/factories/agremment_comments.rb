# == Schema Information
#
# Table name: agremment_comments
#
#  id            :bigint           not null, primary key
#  agremments_id :bigint           not null
#  users_id      :bigint           not null
#  body          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :agremment_comment do
    agremments { nil }
    users { nil }
    body { "MyText" }
  end
end
