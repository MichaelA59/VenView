require 'rails_helper'

feature "Admin can delete venues" do

  scenario "Admin deletes venue from venue show page" do
    user = FactoryGirl.create(:user, role: "admin")
    venue_one = FactoryGirl.create(:venue)
    venue_two = FactoryGirl.create(:venue, name: "Tres Gatos")

    visit root_path

    # User signs in.
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit venue_path(venue_one)

    expect(page).to have_content "Delete Venue"

    click_on "Delete Venue"

    expect(page).not_to have_content venue_one.name
    expect(page).to have_content venue_two.name
  end

  scenario "User who is not an admin cannot delete venue" do
    user = FactoryGirl.create(:user)
    venue_one = FactoryGirl.create(:venue)

    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit venue_path(venue_one)

    expect(page).not_to have_content "Delete Venue"
  end
end
