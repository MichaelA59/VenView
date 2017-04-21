require 'rails_helper'

feature "Edit reviews" do
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

  scenario "I'm on the venue page I should see an edit link for my reviews" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'

    visit venue_path(venue1)

    expect(page).to have_content 'Edit Review'
  end

  scenario "On the venue page, I cannot edit other user's reviews" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'

    visit venue_path(venue2)

    expect(page).not_to have_content 'Edit Review'
  end

  scenario "I'm on venue page and logged in and can go to edit review form" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'

    visit venue_path(venue1)

    click_link 'Edit Review'

    expect(page).to have_content 'Edit Review'
    expect(page).to have_content 'Title'
    expect(page).to have_content review1.title
    expect(page).to have_content 'Cost'
    expect(page).to have_content 'Sound Quality'
    expect(page).to have_content 'Parking/Accessibility'
    expect(page).to have_content 'Comments'
    expect(page).to have_content review1.body
  end

  scenario "I can successfully edit a review" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'

    visit venue_path(venue1)

    click_link 'Edit Review'

    fill_in 'Title', with: 'The new place'
    choose('review_cost_3')
    choose('review_sound_quality_4')
    choose('review_parking_4')
    fill_in 'Comments', with: 'This is the new place that everyone likes'
    click_button 'Submit Review'

    expect(page).to have_content 'The new place'
    expect(page).to have_content 'This is the new place that everyone likes'
    expect(page).not_to have_content review1.title
    expect(page).not_to have_content review1.body
  end

  scenario "My review doesn't save if I don't provide a title" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Sign In'

    visit venue_path(venue1)

    click_link 'Edit Review'

    fill_in 'Title', with: ''
    click_button 'Submit Review'

    expect(page).to have_content 'Title can\'t be blank'
    expect(page).not_to have_content venue1.name
  end
end
