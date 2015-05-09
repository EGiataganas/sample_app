require 'rails_helper'

RSpec.feature "Static Pages", type: :feature do
	
	describe "Home Page" do
  	before(:each) { visit root_path }
    it "should have the content 'Sample App'", focus: true do    	
      expect(page).to have_content('Sample App')
    end
    it "should have the right title" do
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end
  end
end