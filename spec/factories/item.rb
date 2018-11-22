FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "aaa#{n}" }
    preferences { ['drama', 'comedy'] }
  end
end