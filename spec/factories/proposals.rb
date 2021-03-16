FactoryBot.define do
  factory :proposal do
    body { "MyString" }
    votes_count { 1 }
    votes_porcentage { "9.99" }
    user { nil }
    agreement { nil }
  end
end
