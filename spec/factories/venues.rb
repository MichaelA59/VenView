FactoryGirl.define do
  factory :venue do
    sequence(:name) { |n| "venue#{n}" }
    url 'http://www.houseofblues.com'
    address '123 Blues Lane'
    city 'Bahston'
    state 'MA'
    zip '02215'
    capacity '30,000'
  end
end
