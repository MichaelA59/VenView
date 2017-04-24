require 'rails_helper'

feature "User cannot vote if they are not logged in" do
  # As an authenticated user
  # I want to upvote
  # So that I know what reviews I found useful.

  scenario "Unauthenicated user does not see Vote Buttons" do
    venue = FactoryGirl.create(:venue)
    review = FactoryGirl.create(:review,
      venue: venue)

    visit venue_path(venue)

    expect(page).not_to have_content "Upvote"
    expect(page).not_to have_content "Downvote"
    expect(page).to have_content "Votes: 0"
  end
end


feature "Autheticated User can vote" do
  # As an authenticated user
  # I want to upvote
  # So that I know what reviews I found useful.

  let!(:venue) { FactoryGirl.create(:venue) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:review_one) { FactoryGirl.create(:review,
    title: "review_one", venue: venue, user: user) }
  let!(:review_two) { FactoryGirl.create(:review,
    title: "review_two", venue: venue, user: user) }
  let!(:review_three) { FactoryGirl.create(:review, title: "review_three", venue: venue, user: user) }


  scenario "User who has not already voted clicks 'Upvote' on a review" do

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit venue_path(venue)
    expect(page).to have_content "Upvote"
    expect(page).to have_content "Downvote"

    first(:link, 'Upvote').click

    expect(page).to have_content "Votes: 1 Upvoted Downvote review_one"
    expect(page).not_to have_content "Votes: 1 Upvoted Downvote review_two"
  end

  scenario "User has already clicked 'Upvote' on a review and clicks 'Upvote again'" do

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit venue_path(venue)
    expect(page).to have_content "Upvote"
    expect(page).to have_content "Downvote"

    first(:link, 'Upvote').click

    expect(page).to have_content "Votes: 1 Upvoted Downvote review_one"
    expect(page).not_to have_content "Votes: 1 Upvoted Downvote review_two"

    first(:link, 'Upvoted').click

    expect(page).to have_content "Votes: 0 Upvote Downvote review_one"
  end

  scenario "User has already clicked 'Upvote' on a review and clicks 'Downvote'" do

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit venue_path(venue)
    expect(page).to have_content "Upvote"
    expect(page).to have_content "Downvote"

    first(:link, 'Upvote').click
    first(:link, 'Downvote').click

    expect(page).to have_content "Votes: -1 Upvote Downvoted review_one"
  end

  scenario "User has already clicked 'Downvote' on a review and clicks 'Downvote'" do

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit venue_path(venue)
    expect(page).to have_content "Upvote"
    expect(page).to have_content "Downvote"

    first(:link, 'Downvote').click
    first(:link, 'Downvoted').click

    expect(page).to have_content "Votes: 0 Upvote Downvote review_one"
  end

  scenario "User has already clicked 'Downvote' on a review and clicks 'Upvote'" do

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit venue_path(venue)
    expect(page).to have_content "Upvote"
    expect(page).to have_content "Downvote"

    first(:link, 'Downvote').click
    first(:link, 'Upvote').click

    expect(page).to have_content "Votes: 1 Upvoted Downvote review_one"
  end

end
