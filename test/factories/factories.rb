require "faker"

FactoryGirl.define do
  factory :user do
    username
    password Faker::Internet.password

    factory :user_with_tools do
      transient do
        tool_count 2
      end

      after(:create) do |user, evaluator|
        create_list(:tool, evaluator.tool_count, user: user)
      end
    end
  end

  factory :tool do
    name
    price 2000
    quantity 3
    user
  end

  sequence :username do |n|
    "user#{n}"
  end

  sequence :name do |n|
    "name#{n}"
  end
end
