require 'rails_helper'

feature "Admin can see list of users" do

  scenario "Admin deletes user from list of users" do
    user_one = FactoryGirl.create(:user, role: "admin")
    user_two = FactoryGirl.create(:user)
    user_three = FactoryGirl.create(:user)

    visit root_path

    # User_one,  who is an admin, signs in.
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click "Admin Console"
    click "Maintain Users"

    expect(page).to have_content user_two.name
    expect(page).to have_content user_three.name
    first(:link, 'Delete User').click

    visit users_path

    expect(page).not_to have_content user_two.name
    expect(page).to have_content user_three.name
  end

  xscenario "User who is not an admin cannot delete venue" do
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
