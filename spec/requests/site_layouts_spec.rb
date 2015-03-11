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

	it "returns the About page at '/about'" do
		expect(page).to have_link("About", href: about_path)
	end

	it "returns the Contact page at '/contact'" do
		expect(page).to have_link("Contact", href: contact_path)
	end
  end
end
