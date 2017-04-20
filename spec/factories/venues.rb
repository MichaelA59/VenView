FactoryGirl.define do
  factory :venue do
    sequence(:name) { |n| "The Haven#{n}" }
    url 'https://www.google.com/'
    address '2 Perkins Street'
    city 'Jamaica Plain'
    state 'MA'
    zip '02130'
  end
end
