require 'rails_helper'

RSpec.feature "Static Pages", type: :feature do
	
	describe "Home Page" do
    it "should have the content 'Sample App'", focus: true do  
    	visit root_path  	
      expect(page).to have_content('Sample App')
    end
  end
end