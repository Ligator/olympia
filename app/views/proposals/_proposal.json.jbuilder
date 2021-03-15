json.extract! proposal, :id, :body, :votes_count, :votes_porcentage, :user_id, :agreement_id, :created_at, :updated_at
json.url proposal_url(proposal, format: :json)
