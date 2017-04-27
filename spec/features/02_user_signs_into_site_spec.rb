require 'rails_helper'

feature "Sign up" do
  # As a prospective user
  # I want to create an account
  # So that I can post venues and review them
  background do
    # will clear the message queue
    clear_emails
  end

  scenario "Specifying valid and required information" do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Bob'
    fill_in 'Last Name', with: 'Billbob'
    fill_in 'Password', with: 'password123'
    fill_in 'Password Confirmation', with: 'password123'
    fill_in 'Email', with: 'bob.billbob@gmail.com'
    click_button 'Sign Up'

    expect(page).to have_content "A message with a confirmation link has been sent to your email address."

    open_email('bob.billbob@gmail.com')
    current_email.click_link 'Confirm my account'

    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: 'bob.billbob@gmail.com'
    fill_in 'Password', with: 'password123'
    click_button 'Sign In'

    expect(page).to have_content "Welcome back! You are signed in successfully."
    expect(page).not_to have_content "Sign Up"
    expect(page).not_to have_content "Sign In"
    expect(page).to have_content "Sign Out"
  end

  scenario "User omits required information" do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Email can't be blank"
  end

  scenario "User gives invalid information" do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Bob'
    fill_in 'Last Name', with: 'Billbob'
    fill_in 'Password', with: '123'
    fill_in 'Password Confirmation', with: '321'
    fill_in 'Email', with: 'bob.billbob@gmail'
    click_button 'Sign Up'

    expect(page).to have_content "Password is too short (minimum is 7 characters)"
    expect(page).to have_content "Password confirmation doesn't match Password"
    expect(page).to have_content "Email is not a valid email address"
  end

  scenario "User gives email address that already has an account" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password
    fill_in 'Email', with: user.email
    click_button 'Sign Up'

    expect(page).to have_content "An account already exists for that email address!"
  end
end

feature "sign in" do
  # As an unauthenticated user
  # I want to sign in
  # So that I can post venues and review them

  scenario "user signs in successfully" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content "Welcome back! You are signed in successfully."
    expect(page).not_to have_content "Sign Up"
    expect(page).not_to have_content "Sign In"
    expect(page).to have_content "Sign Out"
  end

  scenario "user gives email without an account" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'brianna.billbob@gmail.com'
    fill_in 'Password', with: 'password123'
    click_button 'Sign In'

    expect(page).to have_content "We could not find your email!"
    expect(page).to have_content "Please reenter or create an account."
  end

  scenario "user enters incorrect password" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Sign In'

    expect(page).to have_content "Sorry! Wrong password. Please try again!"
  end
end

feature "sign out" do
  # As an authenticated user
  # I want to sign out
  # So that no one else can post venues or reviews on my behalf

  scenario "successful sign out" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_link "Sign Out"

    expect(page).to have_content "You have been signed out"
  end
end
