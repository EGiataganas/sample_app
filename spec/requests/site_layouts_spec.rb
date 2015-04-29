require 'rails_helper'

RSpec.feature "site links", type: :feature do

  before (:each) do
    visit root_path
  end

  describe "should test layout links" do
    it "returns the Home page at '/'" do
	    expect(page).to have_link("Home", href: root_path)
	 end

  	it "returns the Help page at '/'help" do
  		expect(page).to have_link("Help", href: help_path)
  	end

  	it "returns the About page at '/about', checks implementation. that there is a link inside the page" do
  		expect(page).to have_link("About", href: about_path)
  	end

  	it "returns that by clicking Contact is moving you at contact path, checks behaviour" do
  		click_link "Contact"
  		expect(page.current_path).to eq(contact_path)
  	end

  	it "returns that by clicking Contact is moving you at contact path, checks behaviour" do
  		click_link "Sign up"
  		expect(page.current_path).to eq(signup_path)
  	end

    it "returns that by clicking Contact is moving you at contact path, checks behaviour" do
      click_link "Log in"
      expect(page.current_path).to eq(login_path)
    end

    it "returns that by clicking Contact is moving you at contact path, checks behaviour" # do
    #   click_link "Log out"
    #   expect(page.current_path).to eq(logout_path)
    # end
  end
end
