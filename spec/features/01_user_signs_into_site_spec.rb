require 'rails_helper'

feature "Sign up" do
  # As a prospective user
  # I want to create an account
  # So that I can post venues and review them

  scenario "Specifying valid and required information" do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Bob'
    fill_in 'Last Name', with: 'Billbob'
    fill_in 'Password' , with: 'password123'
    fill_in 'Password Confirmation' , with: 'password123'
    fill_in 'Email', with: 'bob.billbob@gmail.com'
    fill_in 'Avatar URL', with: 'http://t.fod4.com/t/e0c7a42727/c640x360_38.jpg'
    click_button 'Sign Up'

    expect(page).to have_content "You're now signed in as Bob"
    expect(page).not_to have_content "Sign Up"
    expect(page).not_to have_content "Sign In"
    expect(page).to have_content "Sign Out"
  end

  scenario "User omits required information" do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content "First Name can't be blank"
    expect(page).to have_content "Last Name can't be blank"
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Email can't be blank"
  end


  scenario "User gives invalid information" do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Bob'
    fill_in 'Last Name', with: 'Billbob'
    fill_in 'Password' , with: '123'
    fill_in 'Password Confirmation' , with: '321'
    fill_in 'Email', with: 'bob.billbob@gmail'
    fill_in 'Avatar URL', with: ''
    click_button 'Sign Up'

    expect(page).to have_content "Password is too short (minimum is 7 characters)"
    expect(page).to have_content "Password doesn't match confirmation"
    expect(page).to have_content "Email is not a valid email address"
  end
end

feature "sign in" do
  # As an unauthenticated user
  # I want to sign in
  # So that I can post venues and review them

  scenario "user signs in successfully" do
    bob = User.new(first_name: 'Bob', last_name: 'Billbob', password: 'password123', email: 'bob.billbob@gmail.com')

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'bob.billbob@gmail.com'
    fill_in 'Password' , with: 'password123'
    click_link 'Sign In'

    expect(page).to have_content "You're now signed in as Bob"
    expect(page).not_to have_content "Sign Up"
    expect(page).not_to have_content "Sign In"
    expect(page).to have_content "Sign Out"
  end

  scenario "user gives email without an account" do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'brianna.billbob@gmail.com'
    fill_in 'Password' , with: 'password123'
    click_link 'Sign In'

    expect(page).to have_content "We could not find your email! Please reenter or create an account."
  end

  scenario "user enters incorrect password" do
    bob = User.new(first_name: 'Bob', last_name: 'Billbob', password: 'password123', email: 'bob.billbob@gmail.com')

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'bob.billbob@gmail.com'
    fill_in 'Password' , with: 'password12'
    click_link 'Sign In'

    expect(page).to have_content "Your password is incorrect."
  end
end

feature "sign out" do
  # As an authenticated user
  # I want to sign out
  # So that no one else can post venues or reviews on my behalf

  scenario "successful sign out" do
    bob = User.new(first_name: 'Bob', last_name: 'Billbob', password: 'password123', email: 'bob.billbob@gmail.com')

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'bob.billbob@gmail.com'
    fill_in 'Password' , with: 'password123'
    click_link 'Sign In'

    click_link "Sign Out"

    expect(page).to have_content "You have been signed out"
  end
end
