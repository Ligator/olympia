# == Schema Information
#
# Table name: orders
#
#  id              :bigint           not null, primary key
#  user_id         :bigint
#  amount_in_cents :integer
#  state           :string           default("pending")
#  payment_method  :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  stripe_session  :string
#
FactoryBot.define do
  factory :order do
    store { nil }
    user_id { 1 }
    amount_in_cents { 1 }
    state { "MyString" }
    payment_method { "MyString" }
  end
end
