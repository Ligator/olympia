class AgreementVote < ApplicationRecord
  belongs_to :agreement
  belongs_to :proposal
  belongs_to :user
end
