require 'rails_helper'

RSpec.describe "SiteLayouts", type: :request do

  it "should test layout links" do
    get root_path
    expect(response.body).to match("a href=\"#{root_path}\"")
    expect(response.body).to match("a href=\"#{help_path}\"")
    # expect(response.body).to include 'a href="/help"'
    expect(response.body).to match("a href=\"#{about_path}\"")
    expect(response.body).to match("a href=\"#{contact_path}\"")
  end
end
