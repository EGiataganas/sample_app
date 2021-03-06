require 'rails_helper'
require 'spec_helper'

RSpec.feature "UsersLogins", :type => :feature do
  
  def setup
    @user = users(:michael)
  end

  scenario "login with invalid information" do
    # test "login with invalid information" do
    #     get login_path
    #     assert_template 'sessions/new'
    #     post login_path, session: { email: "", password: "" }
    #     assert_template 'sessions/new'
    #     assert_not flash.empty?
    #     get root_path
    #     assert flash.empty?
    #   end
    visit login_path
    # expect(page).to render_template('sessions/new')
    fill_in "Email", :with => ""
    fill_in "Password", :with => ""
    click_button "Log in"

    expect(User.count).to be_zero
    expect(page).to have_text("Invalid email/password combination")
    visit root_path
    expect(page).not_to have_text("Invalid email/password combination")
    # expect(flash[:danger]).to be_empty
  end

  scenario "login with valid information" do
      # test "login with valid information" do
      #   get login_path
      #   post login_path, session: { email: @user.email, password: 'password' }
      #   assert_redirected_to @user
      #   follow_redirect!
      #   assert_template 'users/show'
      #   assert_select "a[href=?]", login_path, count: 0
      #   assert_select "a[href=?]", logout_path
      #   assert_select "a[href=?]", user_path(@user)
      # end
    visit login_path

    fill_in "Email", :with => '<%=@user.email%>'
    fill_in "Password", :with => 'password'
    click_button "Log in"

    expect(User.count).to be_zero
    # expect(page).to redirect_to(@user)
  end

  scenario "login with valid information followed by logout" do
      # test "login with valid information followed by logout" do
      #   get login_path
      #   post login_path, session: { email: @user.email, password: 'password' }
      #   assert is_logged_in?
      #   assert_redirected_to @user
      #   follow_redirect!
      #   assert_template 'users/show'
      #   assert_select "a[href=?]", login_path, count: 0
      #   assert_select "a[href=?]", logout_path
      #   assert_select "a[href=?]", user_path(@user)
      #   delete logout_path
      #   assert_not is_logged_in?
      #   assert_redirected_to root_url
      #   # Simulate a user clicking logout in a second window.
      #   delete logout_path
      #   follow_redirect!
      #   assert_select "a[href=?]", login_path
      #   assert_select "a[href=?]", logout_path,      count: 0
      #   assert_select "a[href=?]", user_path(@user), count: 0
      # end
  end

  scenario "authenticated? should return false for a user with nil digest" do
    # expect(@user.authenticated?('')).to be_fasley
    # test "authenticated? should return false for a user with nil digest" do
    #   assert_not @user.authenticated?('')
    # end
  end

  scenario "login with remembering" do
    # log_in_as(@user, remember_me: '1')
    # expect(cookies['remember_token']).not_to be_nil
    # test "login with remembering" do
    #   log_in_as(@user, remember_me: '1')
    #   assert_not_nil cookies['remember_token']
    # end
  end

  scenario "" do
    # log_in_as(@user, remember_me: '0')
    # expect(cookies['remember_token']).to be_nil
    # test "login without remembering" do
    #   log_in_as(@user, remember_me: '0')
    #   assert_nil cookies['remember_token']
    # end
  end
end