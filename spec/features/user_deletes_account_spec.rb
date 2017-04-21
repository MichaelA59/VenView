require 'rails_helper'

feature "User deletes account" do
  # As an authenticated user
  # I want to delete my account
  # So that my information is no longer retained by the app

  scenario "User deletes their own account via a button on their account" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_link "Signed In As #{user.first_name}"
    expect(page).to have_content user.first_name
    expect(page).to have_content user.last_name
    expect(page).to have_content user.email

    expect(page).to have_content
      "Bye! Your account has been successfully cancelled."
  end
end
