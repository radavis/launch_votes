FactoryGirl.define do
  factory :user do
    first_name "generic"
    sequence(:last_name) { |n| "user ##{n}" }
    sequence(:email) { |n| "test_user#{n}@example.com" }
    password "test1234"
  end
end
