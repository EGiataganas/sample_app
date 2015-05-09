require 'rails_helper'

RSpec.feature "Static Pages", type: :feature, focus: true  do
	
	describe "Home Page" do
  	before(:each) { visit root_path }
    it "should have the content 'Sample App'"do    	
      expect(page).to have_content('Sample App')
    end
    it "should have the right title" do
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end
  end

  describe "Contact page" do
  	before(:each) { visit contact_path }
    it "should have the content 'Help'" do
      expect(page).to have_content('Contact')
    end
    it "should have the right title 'Contact'" do
      expect(page).to have_title("Contact | Ruby on Rails Tutorial Sample App")
    end
  end

  describe "About page" do
  	before(:each) { visit about_path }
    it "should have the content 'About Us'" do
      expect(page).to have_content('About Us')
    end
    it "should have the right title 'About Us'" do
      expect(page).to have_title("About Us | Ruby on Rails Tutorial Sample App")
    end
  end

  describe "Help page" do
  	before(:each) { visit help_path }
    it "should have the content 'Help'" do
      expect(page).to have_content('Help')
    end
    it "should have the right title 'Help'" do
      expect(page).to have_title("Help | Ruby on Rails Tutorial Sample App")
    end
  end
end