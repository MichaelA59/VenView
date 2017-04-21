# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

5.times do
  foo = Venue.create

  foo.name = Faker::Hipster.word
  foo.url = Faker::Internet.url
  foo.address = Faker::Address.street_address
  foo.city = Faker::Address.city
  foo.state = Faker::Address.state_abbr
  foo.zip = Faker::Number.number(5).to_s
  foo.capacity = Faker::Number.between(5000, 30000)

  foo.save!
end

5.times do
  foo = User.create

  foo.first_name = Faker::Name.first_name
  foo.last_name = Faker::Name.last_name
  foo.email = Faker::Internet.email
  foo.password = "password"

  foo.save!
end

10.times do
  foo = Review.create

  foo.title = Faker::ChuckNorris.fact
  foo.user_id = 1 + rand(User.all.size)
  foo.venue_id = 1 + rand(Venue.all.size)

  foo.save!
end
