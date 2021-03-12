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
class AgremmentComment < ApplicationRecord
  belongs_to :agremments
  belongs_to :users
end
