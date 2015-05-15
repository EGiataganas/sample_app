require 'rails_helper'

RSpec.feature "UsersSignups", :type => :feature do
  background { visit signup_path }
  given(:submit) { "Create my account" }
  
  scenario "invalid signup information" do
    fill_in "Name", :with => ""
    fill_in "Email", :with => "user@invalid"
    fill_in "Password", :with => "foo"
    fill_in "Confirmation", :with => "bar"

    expect { click_button submit }.not_to change(User, :count)
    expect(page).to have_text("The form contains 5 errors.")
    expect(current_path).not_to eq new_user_path
  end

  scenario "valid signup information" do
    fill_in "Name", :with => "User Example"
    fill_in "Email", :with => "user@valid.com"
    fill_in "Password", :with => "foobar"
    fill_in "Confirmation", :with => "foobar"
    
    expect { click_button submit }.to change(User, :count)
    expect(page).to have_text("Welcome to the Sample App!")


    # given(:user) { User.find_by(email: 'user@example.com') }

    # it { should have_title(user.name) }
    # expect(User.find_by(email: 'user@valid.com')).to be_true(is_logged_in?)
    # expect(page.current_path).not_to eq new_user_path
    # expect(page).to have_text("Welcome to the Sample App!")
  end

  # describe "sign up" do
    # background { visit signup_path }

    # given(:submit) { "Create my account" }

    # scenario "with invalid information" do
    #   # it "should not create a user" do
    #     expect { click_button submit }.not_to change(User, :count)
    #   # end
    # end

    # # describe "with valid information" do
    #   background do
    #     fill_in "Name",         with: "Example User"
    #     fill_in "Email",        with: "user@example.com"
    #     fill_in "Password",     with: "foobar"
    #     fill_in "Confirmation", with: "foobar"
    #   end

    #   scenario "should create a user" do
    #     expect { click_button submit }.to change(User, :count).by(1)
    #   end
  #   end
  # end

  # describe "sign up" do
  #   before { visit signup_path }

  #   let(:submit) { "Create my account" }

  #   describe "with invalid information" do
  #     it "should not create a user" do
  #       expect { click_button submit }.not_to change(User, :count)
  #     end
  #   end

  #   describe "with valid information" do
  #     before do
  #       fill_in "Name",         with: "Example User"
  #       fill_in "Email",        with: "user@example.com"
  #       fill_in "Password",     with: "foobar"
  #       fill_in "Confirmation", with: "foobar"
  #     end

  #     it "should create a user" do
  #       expect { click_button submit }.to change(User, :count).by(1)
  #     end
  #   end
  # end

end