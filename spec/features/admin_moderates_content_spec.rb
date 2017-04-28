require 'rails_helper'

feature "Admin can see list of users" do
  scenario "Admin can delete reviews" do
    user_one = FactoryGirl.create(
      :user,
      first_name: "Larry",
      last_name: "Bird",
      role: "admin"
    )
    user_two = FactoryGirl.create(
      :user,
      first_name: "Bobby",
      last_name: "Orr"
    )
    venue_one = FactoryGirl.create(:venue)
    review_one = FactoryGirl.create(
      :review,
      user: user_two,
      venue: venue_one
    )
    review_two = FactoryGirl.create(
      :review,
      user: user_two,
      venue: venue_one,
      title: "Great place"
    )
    review_three = FactoryGirl.create(
      :review,
      user: user_two,
      venue: venue_one,
      title: "Just ok"
    )

    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user_one.email
    fill_in 'Password', with: user_one.password
    click_button 'Sign In'

    expect(page).to have_content 'Admin Console'
    click_link 'Admin Console'
    click_link 'Maintain Venues'
    click_link venue_one.name

    expect(page).not_to have_content 'Edit Review'
    expect(page).to have_content 'Delete Review'

    first(:link, 'Delete Review').click

    expect(page).to have_content review_one.title
    expect(page).to have_content review_two.title
    expect(page).not_to have_content review_three.title
  end

  scenario "Admin deletes user from list of users" do
    user_one = FactoryGirl.create(
      :user,
      first_name: "Larry",
      last_name: "Bird",
      role: "admin"
    )
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

    click_link 'Sign In'
    fill_in 'Email', with: user_one.email
    fill_in 'Password', with: user_one.password
    click_button 'Sign In'

    expect(page).to have_content 'Admin Console'
    click_on 'Admin Console'
    click_link 'Maintain Users'

    expect(page).to have_content user_two.first_name
    expect(page).to have_content user_three.last_name

    click_link "#{user_two.first_name} #{user_two.last_name}"
    click_link 'Delete User\'s Account'

    expect(page).not_to have_content user_two.first_name
    expect(page).to have_content user_three.last_name
  end
end
