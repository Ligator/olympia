# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  guest                  :boolean          default(FALSE)
#  locale                 :string           default("es")
#  stripe_customer_id     :string
#  first_name             :string
#  last_name              :string
#  phone                  :string
#  new_partner            :boolean
#  role                   :string           default("customer")
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
