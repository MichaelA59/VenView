require 'rails_helper'

feature "Venues" do

  scenario "Seeing a list of all venues" do
    venue_one = FactoryGirl.create(:venue)
    venue_two = FactoryGirl.create(:venue)

    visit root_path
    click_link 'Venues'
    expect(page).to have_content venue_one.name
    expect(page).to have_content venue_two.name
  end

  scenario "Adding a new venue" do
    user = FactoryGirl.create(:user)

    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit venues_path
    click_link 'Add a Venue'

    expect(page).to have_content "New Venue Form"

    fill_in 'Name', with: 'Horse of Blues'
    fill_in 'Website', with: 'http://www.bluehorse.com'
    fill_in 'Address', with: '123 Fake Street'
    fill_in 'City', with: 'Slummerville'
    select 'Massachusetts', from: 'State'
    fill_in 'Zip', with: "12345"
    fill_in 'Capacity', with: '9384'

    click_button 'Create Venue'

    expect(page).to have_content "Venue added successfully!"
    expect(page).to have_content "Horse of Blues"
    expect(page).to have_link('Venue Website', href: "http://www.bluehorse.com")
    expect(page).to have_content "123 Fake Street"
    expect(page).to have_content "Slummerville"
    expect(page).to have_content "MA"
    expect(page).to have_content "12345"
    expect(page).to have_content "9384"
  end

  scenario "Viewing a venue" do
    venue_one = FactoryGirl.create(:venue)
    venue_two = FactoryGirl.create(:venue)

    visit venues_path
    click_link venue_one.name

    expect(page).to have_content venue_one.name
    expect(page).to have_link('Venue Website', href: venue_one.url)
    expect(page).to have_content venue_one.address
    expect(page).to have_content venue_one.city
    expect(page).to have_content venue_one.state
    expect(page).to have_content venue_one.zip
    expect(page).to have_content venue_one.capacity

    expect(page).not_to have_content venue_two.name
  end

  scenario "Failing to add a venue with no information" do
    user = FactoryGirl.create(:user)

    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit venues_path
    click_link 'Add a Venue'

    fill_in 'Name', with: ''
    fill_in 'Website', with: ''
    fill_in 'Address', with: ''
    fill_in 'City', with: ''
    select 'Alabama', from: 'State'
    fill_in 'Zip', with: ''
    fill_in 'Capacity', with: ''

    click_button 'Create Venue'

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Address can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("Zip can't be blank")
    expect(page).to have_content("Zip is the wrong length")
    expect(page).to have_content("Zip is not a number")
  end

  scenario "Failing to add a venue with an invalid URL" do
    user = FactoryGirl.create(:user)

    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit venues_path
    click_link 'Add a Venue'

    fill_in 'Name', with: 'House of Blorbs'
    fill_in 'Website', with: 'kdfjals'
    fill_in 'Address', with: '555 Evergreen Terrace'
    fill_in 'City', with: 'Springfield'
    select 'Alabama', from: 'State'
    fill_in 'Zip', with: '12345'
    fill_in 'Capacity', with: '1341'

    click_button 'Create Venue'
    expect(page).to have_content("Url is invalid")
  end
end
