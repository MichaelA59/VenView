require 'rails_helper'

feature "User uploads profile picture:" do
  scenario "User uploads profile picture" do
    user = FactoryGirl.create(:user)

    visit root_path

    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
    click_link "Signed In As #{user.first_name}"

    click_link "Edit Profile"

    expect(page).to have_content "Edit Your Profile"

    page.find('#user_avatar').click
    attach_file("Upload Your File", Rails.root + "spec/fixtures/test_picture.jpg")
    click_button 'Open'

    click_link "Update Profile"

    expect(page).to have_content "Success! Your profile has been updated."
    expect(page).to have_content "foo@foo.com"
  end
end
