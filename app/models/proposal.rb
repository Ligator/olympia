class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :agreement
  validates_presence_of :body
end
