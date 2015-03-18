require 'rails_helper'

RSpec.feature "UsersSignups", :type => :feature do
  scenario "invalid signup information" do
    visit signup_path

    fill_in "Name", :with => ""
    fill_in "Email", :with => "user@invalid"
    fill_in "Password", :with => "foo"
    fill_in "Confirmation", :with => "bar"
    click_button "Create my account"

    expect(User.count).to be_zero
    expect(page).to have_text("The form contains 4 errors.")
    # expect(page.current_path).to eq new_user_path
  end

  scenario "valid signup information" do
    visit signup_path

    fill_in "Name", :with => "User Example"
    fill_in "Email", :with => "user@valid.com"
    fill_in "Password", :with => "foobar"
    fill_in "Confirmation", :with => "foobar"
    click_button "Create my account"

    expect(User.count).to be(1)
    expect(page).to have_text("Welcome to the Sample App!")
    # expect(page.current_path).to eq(user_path, id: 1)
  end
end