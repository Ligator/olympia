class AgreementVote < ApplicationRecord
  belongs_to :agreement
  belongs_to :preposal
  belongs_to :user
end
