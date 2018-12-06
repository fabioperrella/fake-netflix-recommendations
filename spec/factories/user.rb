FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "aaa#{n}@aaaa.com" }
    sequence(:name) { |n| "aaa#{n}" }
    preferences { ['drama', 'comedy'] }
  end
end