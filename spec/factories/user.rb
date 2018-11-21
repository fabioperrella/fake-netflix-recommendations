FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "aaa#{n}@aaaa.com" }
    preferences { ['drama', 'comedy'] }
  end
end