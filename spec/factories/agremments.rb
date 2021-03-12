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
FactoryBot.define do
  factory :agremment do
    title { "MyString" }
    description { "MyText" }
    state { "MyText" }
    users { nil }
  end
end
