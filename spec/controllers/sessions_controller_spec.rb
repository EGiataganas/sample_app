require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  render_views

  before (:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "returns the right title" do
      get :new
      expect(response.body).to have_content("Log in | #{@base_title}")
    end
  end

  describe "POST 'create'" do
    describe "failure" do

      before(:each) { @attr = {email: "", password: ""} }
      
      it "should re-render the 'new' page" do
        post :create, session: @attr
        expect(response.body).to render_template(:new)
      end 

      # it "should have an error message" do
      #   post :create, session: @attr
      #   expect(flash: { error: "Invalid email/password combination!" }).to match(/invalid/i)
      # end

      # it "returns the right title" do
      #   post :create, session: @attr
      #   expect(response).to have_content("Log in | #{@base_title}")
      # end

    end

    describe "success" do
      
      before(:each) do
      	@user = FactoryGirl.create :user
      	@attr = { email: @user.email, password: 'foobar' } 
      end

      it "should log the user in" do
        post :create, session: @attr
        expect(response).to redirect_to(@user)
      end

      # it "returns the right title" do
      #   post :create, user: @attr
      #   expect(response).to have_content("Sign up | #{@base_title}")
      # end

      it "should redirect to the user show page" do
        post :create, session: @attr
        expect(response).to redirect_to(user_path(@user))
      end 
    end
  end
end
