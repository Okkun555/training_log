FactoryBot.define do
  factory :training_item do
    association :created_user, factory: :user
    sequence(:name) { |n| "#{n}_" + '種目名' }
    weight_unit { Faker::Number.between(from: 1, to: 2) }
  end
end
