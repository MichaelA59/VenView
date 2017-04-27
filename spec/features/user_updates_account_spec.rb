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

    fill_in "user_profile_pic_url",
      with: "https://media4.giphy.com/media/jp2KXzsPtoKFG/giphy.gif"

    click_button "Update Profile"

    expect(page).to have_content "Success! Your profile has been updated."
    expect(page).to have_xpath "//img[@src='https://media4.giphy.com/media/jp2KXzsPtoKFG/giphy.gif']"
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
