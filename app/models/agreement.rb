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
class Agreement < ApplicationRecord
  belongs_to :user
end
