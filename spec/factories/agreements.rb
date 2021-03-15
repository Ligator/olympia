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
FactoryBot.define do
  factory :agreement do
    title { "MyString" }
    description { "MyText" }
    state { "MyString" }
    user { nil }
  end
end
