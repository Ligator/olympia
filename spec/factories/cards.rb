# == Schema Information
#
# Table name: cards
#
#  id              :bigint           not null, primary key
#  number_card     :string
#  name_bank       :string
#  titular_name    :string
#  expiration_date :date
#  type            :string
#  user_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :card do
    number_card { 1 }
    name_bank { "MyString" }
    titular_name { "MyString" }
    expiration_date { "2021-03-05" }
    type { "" }
    user { nil }
  end
end
