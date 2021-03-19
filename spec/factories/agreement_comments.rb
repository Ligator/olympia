FactoryBot.define do
  factory :agreement_comment do
    agreement { nil }
    user { nil }
    body { "MyText" }
  end
end
