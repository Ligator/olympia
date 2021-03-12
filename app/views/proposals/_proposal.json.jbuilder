json.extract! proposal, :id, :body, :votes_count, :votes_porcentage, :users_id, :agremments_id, :created_at, :updated_at
json.url proposal_url(proposal, format: :json)
