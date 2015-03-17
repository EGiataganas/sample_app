require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  before (:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "GET #show" do

    before (:each) do
      @user = FactoryGirl.create :user
    end

    it "returns http success" do
      get :show, id: @user
      expect(response).to have_http_status(:success)
    end

    it "returns the right user" do
      get :show, id: @user
      expect(assigns(:user)).to eq(@user)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end


    it "returns the right title" do
      get :new
      expect(response.body).to have_content("Sign up | #{@base_title}")
    end
  end

end
