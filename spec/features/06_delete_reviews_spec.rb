require 'rails_helper'

feature "Delete reviews" do
  # As an authenticated user
  # I want to add a review for a venue
  # So I can share my opinion

  let!(:venue1) { FactoryGirl.create(:venue) }
  let!(:venue2) { FactoryGirl.create(:venue) }
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:review1) do
    Review.create(
    venue_id: venue1.id, user_id: user1.id,
    title: 'This is a great place', cost: 3, sound_quality: 3, parking: 4,
    body: 'This is a great place to check out'
    )
  end
  let!(:review2) do
    Review.create(
    venue_id: venue2.id, user_id: user2.id,
    title: 'I hate this place', cost: 3, sound_quality: 0, parking: 4,
    body: 'Don\'t go here'
    )
  end

  scenario "I'm on the venue page I should see an delete link for my reviews" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'

    visit venue_path(venue1)

    expect(page).to have_content 'Delete Review'
  end

  scenario "On venue page, I cannot delete other user's reviews" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'

    visit venue_path(venue2)

    expect(page).not_to have_content 'Delete Review'
  end

  scenario "On venue page and logged in, I can successfully delete a review" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'

    visit venue_path(venue1)

    click_link 'Delete Review'

    expect(page).not_to have_content review1.title
  end
end
