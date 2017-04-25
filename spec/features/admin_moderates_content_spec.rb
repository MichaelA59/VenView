require 'rails_helper'

feature "Admin can see list of users" do

  scenario "Admin deletes user from list of users" do
    user_one = FactoryGirl.create(
      :user,
      first_name: "Larry",
      last_name: "Bird",
      role: "admin")
    user_two = FactoryGirl.create(
      :user,
      first_name: "Bobby",
      last_name: "Orr"
    )
    user_three = FactoryGirl.create(
      :user,
      first_name: "Shaquille",
      last_name: "ONeal"
      )

    visit root_path

    # User_one,  who is an admin, signs in.
    click_link 'Sign In'

    fill_in 'Email', with: user_one.email
    fill_in 'Password', with: user_one.password

    click_button 'Sign In'

    binding.pry
    click_link "Admin Console"
    click_link "Maintain Users"

    expect(page).to have_content user_two.first_name
    expect(page).to have_content user_three.last_name

    click_link "#{user_two.first_name} #{user_two.last_name}"
    click_link "Delete Account"
    click_link 'Sign In'

    fill_in 'Email', with: user_one.email
    fill_in 'Password', with: user_one.password

    click_button 'Sign In'
    click_link "Admin Console"
    click_link "Maintain Users"

    expect(page).not_to have_content user_two.first_name
    expect(page).to have_content user_three.last_name
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
