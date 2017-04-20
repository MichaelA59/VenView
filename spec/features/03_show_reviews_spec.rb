require 'rails_helper'

feature "Show reviews" do
  # As an user
  # I want to view reviews of a venue
  # So I can get more information


  scenario "I'm on the venue page I should see any reviews for this venue" do
    @venue = FactoryGirl.create(:venue)
    venue2 = FactoryGirl.create(:venue)
    user = FactoryGirl.create(:user)

    review1 = Review.create(venue_id: @venue.id, user_id: user.id, title:'This is a great place', cost: 3, sound_quality: 3, parking: 4, body:'This is a great place to check out')
    review2 = Review.create(venue_id: venue2.id, user_id: user.id, title:'I hate this place', cost: 3, sound_quality: 0, parking: 4, body:'Don\'t go here')

    visit venue_path(@venue)

    expect(page).to have_content review1.title
    expect(page).to have_content review1.body
    expect(page).not_to have_content review2.title
    expect(page).not_to have_content review2.body
    expect(page).to have_content 'Cost'
    expect(page).to have_content 'Sound Quality'
    expect(page).to have_content 'Parking'
  end
end
