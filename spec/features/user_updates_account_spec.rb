require 'rails_helper'

feature "User updates account:" do
  # As an authenticated user
  # I want to delete my account
  # So that my information is no longer retained by the app

  scenario "User successfully updates their account with new email address" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
    click_link "Signed In As #{user.first_name}"

    click_link "Edit Profile"

    expect(page).to have_content "Edit Your Profile"

    fill_in 'Email', with: "foo@foo.com"

    click_button 'Update Profile'

    expect(page).to have_content "Success! Your profile has been updated."
    expect(page).to have_content "foo@foo.com"
  end

  scenario "User successfully updates their account with a new avatar url" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
    click_link "Signed In As #{user.first_name}"
    click_link "Edit Profile"

    fill_in "user_avatar_url", with: "http://cdn3-www.dogtime.com/assets/uploads/gallery/30-impossibly-cute-puppies/impossibly-cute-puppy-21.jpg"

    binding.pry
    click_button "Update Profile"
    binding.pry

    expect(page).to have_content "Success! Your profile has been updated."
    expect(page).to have_xpath("//img[@src='http://cdn3-www.dogtime.com/assets/uploads/gallery/30-impossibly-cute-puppies/impossibly-cute-puppy-21.jpg']")
  end

  scenario "User unsucessfully tries to update account with invalid email" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
    click_link "Signed In As #{user.first_name}"
    click_link "Edit Profile"

    fill_in 'Email', with: "foo@foo"

    click_button "Update Profile"

    expect(page).to have_content "Email is not a valid email address"
  end

end
