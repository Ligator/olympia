FactoryBot.define do
  factory :store do
    sequence(:name) { |n| "mystore_#{n}" }
  end
end
