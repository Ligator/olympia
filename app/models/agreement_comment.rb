class AgreementComment < ApplicationRecord
  belongs_to :agreement
  belongs_to :user
end
