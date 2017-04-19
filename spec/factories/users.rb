FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    first_name 'Bob'
    last_name 'Billbob'
    password 'password123'
    password_confirmation 'password123'
  end
end
