require 'rails_helper'

RSpec.feature "UsersLogins", :type => :feature do
  scenario "login with invalid information" do
    visit login_path

    fill_in "Email", :with => ""
    fill_in "Password", :with => ""
    click_button "Log in"

    expect(User.count).to be_zero
    expect(page).to have_text("Invalid email/password combination")
    visit root_path
    expect(page).not_to have_text("Invalid email/password combination")
  end
end