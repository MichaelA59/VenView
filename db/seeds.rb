# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## SEEDS FOR VENUE

Venue.create(
  name: 'House of Blues',
  url: 'http://www.houseofblues.com/boston',
  address: '15 Lansdowne St',
  city: 'Boston',
  state: 'MA',
  zip: '02215',
  capacity: '5000'
)

Venue.create(
  name: 'Paradise Rock Club',
  url: 'http://crossroadspresents.com/paradise-rock-club/',
  address: '967 Commonwealth Avenue',
  city: 'Boston',
  state: 'MA',
  zip: '02215',
  capacity: '2000'
)

Venue.create(
  name: 'Xfinity Center',
  url: 'http://www.mansfieldamp.com/',
  address: '885 S Main St',
  city: 'Mansfield',
  state: 'MA', zip:
  '03048',
  capacity: '10000'
)

Venue.create(
  name: 'The Haven',
  url: 'http://thehavenjp.com/',
  address: '2 Perkins St',
  city: 'Jamaica Plain',
  state: 'MA',
  zip: '02130',
  capacity: ''
)

Venue.create(
  name: '52 Church St',
  url: 'http://www.sinclaircambridge.com/',
  address: '15 Lansdowne St',
  city: 'Cambridge',
  state: 'MA',
  zip: '02138',
  capacity: '3500'
)


## SEEDS FOR USERS

User.create(
  first_name: 'Brianna',
  last_name: 'Kincart',
  email: 'brianna@test.com',
  password: 'password'
)

User.create(
  first_name: 'Christine',
  last_name: 'Sohn',
  email: 'christine@test.com',
  password: 'password'
)

User.create(
  first_name: 'Keith',
  last_name: 'Hubert',
  email: 'keith@test.com',
  password: 'password'
)

User.create(
  first_name: 'Liz',
  last_name: 'Chhouk',
  email: 'liz@test.com',
  password: 'password'
)

User.create(
  first_name: 'Mike',
  last_name: 'Adamski',
  email: 'mike@test.com',
  password: 'password')


# SEEDS FOR REVIEWS

Review.create(
  title: 'This is the best place ever!',
  user_id: 2,
  venue_id: 3,
  cost: 3,
  sound_quality: 5,
  parking: 2,
  body: ''
)

Review.create(
  title: 'This place is fine',
  user_id: 2,
  venue_id: 5,
  cost: 1,
  sound_quality: 4,
  parking: 3,
  body: 'The music was great but it was jam packed and the drinks were expensive!'
)

Review.create(
  title: 'Great local spot',
  user_id: 3,
  venue_id: 4,
  cost: 2,
  sound_quality: 1,
  parking: 2,
  body: 'Corner bar with friendly owner and delicious food'
)

Review.create(
  title: 'Great lawn space',
  user_id: 3,
  venue_id: 3,
  cost: 4,
  sound_quality: 2,
  parking: 4,
  body: 'Summer nights at this arena are amazing. Get lawn seats and just gaze up at the stars while listening to incredible feel-good summery music!')

Review.create(
  title: 'Wonderful attached restaurant',
  user_id: 3,
  venue_id: 5,
  cost: 5,
  sound_quality: 3,
  parking: 1,
  body: 'This place is jamming and the attached restaurant has great food and AMAZING cocktails'
)

Review.create(
  title: 'Local and hipster vibe',
  user_id: 1,
  venue_id: 2,
  cost: 3,
  sound_quality: 2,
  parking: 5,
  body: 'Saw Johnnyswim here. The venue is great - multiple bars and a cool crowd. I love the balcony up top.')

Review.create(
  title: 'Great bites and casual live music',
  user_id: 4,
  venue_id: 4,
  cost: 5,
  sound_quality: 4,
  parking: 1,
  body: ''
)

Review.create(
  title: 'Incredible and intimate venue',
  user_id: 4,
  venue_id: 5,
  cost: 2,
  sound_quality: 5,
  parking: 4,
  body: 'I saw Marc Broussard here and it was incredible - sound quality is fantastic and it was such an up-close experience!'
)

Review.create(
  title: 'Lots of college kids',
  user_id: 5,
  venue_id: 2,
  cost: 2,
  sound_quality: 2,
  parking: 3,
  body: 'Lots of students come here as it\'s right in BU\'s campus'
)

Review.create(
  title: 'Overcrowded and rude bouncers',
  user_id: 5,
  venue_id: 1,
  cost: 4,
  sound_quality: 1,
  parking: 4,
  body: 'The bouncers wouldn\'t let us in cuz we had our kids with us - total meatheads.'
)
