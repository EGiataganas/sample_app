require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  render_views

  before (:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end

    it "returns the right title" do
      get :home
      expect(response.body).to have_content("Home | #{@base_title}")
    end

    it "returns a non blank body" do
      get :home
      expect(response.body).not_to match(/<body>\s*<\/body>/)
    end
  end

  describe "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end

    it "returns the right title" do
      get :contact
      expect(response.body).to have_content("Contact | #{@base_title}")
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end

    it "returns the right title" do
      get :about
      expect(response.body).to have_content("About | #{@base_title}")
    end
  end

end
