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
    attach_file(
      "Avatar Upload",
      Rails.root + "spec/fixtures/files/test_picture.jpg"
    )

    click_button "Update Profile"

    expect(page).to have_content "Success! Your profile has been updated."
    expect(page).to have_xpath '//img[contains(@src,"/thumb_test_picture.jpg")]'
  end

  scenario "User deletes profile picture" do
    user = FactoryGirl.create(:user)

    visit root_path

    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
    click_link "Signed In As #{user.first_name}"
    click_link "Edit Profile"

    page.find('#user_avatar').click
    attach_file(
      "Avatar Upload",
      Rails.root + "spec/fixtures/files/test_picture.jpg"
    )

    click_button "Update Profile"
    click_link "Edit Profile"

    check "delete-avatar"
    click_button "Update Profile"

    expect(page).to have_content "Success! Your profile has been updated."
    expect(page).not_to have_xpath '//img[contains(@src,"/thumb_test_picture.jpg")]'
  end
end
