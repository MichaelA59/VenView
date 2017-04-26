require 'rails_helper'

feature "Admin can update venues" do

  scenario "Admin updates venue from venue show page" do
    user = FactoryGirl.create(:user, role: "admin")
    venue_one = FactoryGirl.create(:venue)

    visit root_path

    # User signs in.
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit venue_path(venue_one)

    expect(page).to have_content "Update Venue"

    click_on "Update Venue"

    # User is on the Edit Venue page.
    # User expects the page to be prepopulated.
    # User updates the venue with new information.
    expect(page).to have_xpath "//input[@value=\"#{venue_one.name}\"]"
    fill_in 'City', with: "New York"

    click_on "Update Venue"

    # User is redirected to page for venue.
    expect(page).to have_content venue_one.name
    expect(page).to have_content "New York"
  end

  scenario "User who is not an admin cannot not update venue" do
    user = FactoryGirl.create(:user)
    venue_one = FactoryGirl.create(:venue)

    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit venue_path(venue_one)

    expect(page).not_to have_content "Update Venue"
  end
end
