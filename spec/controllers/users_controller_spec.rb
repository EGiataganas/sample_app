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

    it "returns the right title" do
      get :show, id: @user
      expect(response.body).to have_content("#{@user.name} | #{@base_title}")
    end

    it "returns the user's name" do
      get :show, id: @user
      expect(response.body).to have_selector('h1', text: @user.name)
    end

    it "returns the user's picture" do
      get :show, id: @user
      expect(response.body).to have_css('h1>img.gravatar')
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

  describe "POST 'create'" do
  	describe "failure" do
  		
		  before(:each) do
		    @attr = { 
		      name: "", email: "", password: "",
		      password_confirmation: "" }
		  end

	    # it "returns the right title" do
	    #   post :create, user: @attr
	    #   expect(response).to have_content("Sign up | #{@base_title}")
	    # end

	    it "should render the 'new' page" do
	      post :create, user: @attr
	      expect(response.body).to render_template(:new)
	    end 

		  it "should not create a user" do
		    expect(lambda {post :create, user:@attr}).not_to change(User, :count)
		  end
  	end

  	describe "success" do
  		
		  before(:each) do
		    @attr = { 
		      name: "New User", email: "user@example.com", 
		      password: "foobar", password_confirmation: "foobar" }
		  end

		  it "should create a user" do
		    expect(lambda {post :create, user:@attr}).to change(User, :count).by(1)
		  end

	    # it "returns the right title" do
	    #   post :create, user: @attr
	    #   expect(response).to have_content("Sign up | #{@base_title}")
	    # end

	    it "should render the 'new' page" do
	      post :create, user: @attr
	      expect(response.body).to redirect_to(user_path(assigns(:user)))
	    end 
  	end
  end
end
