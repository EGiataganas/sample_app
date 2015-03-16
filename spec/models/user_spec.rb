# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string
#  email              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  encrypted_password :string
#  salt               :string
#

require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @attr = { 
      name: "Example User",
      email: "user@example.com",
      password: "foobar",
      password_confirmation: "foobar"
    }
  end
  
  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end
  
  it "should require a name" do
    no_name_user = User.new(@attr.merge(name: ""))
    expect(no_name_user).not_to be_valid
  end
  
  it "should require an email address" do
    no_email_user = User.new(@attr.merge(email: ""))
    expect(no_email_user).not_to be_valid
  end
  
  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_user = User.new(@attr.merge(name: long_name))
    expect(long_name_user).not_to be_valid
  end
  
  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(email: address))
    expect(valid_email_user).to be_valid
    end
  end
  
  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(email: address))
      expect(invalid_email_user).not_to be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    expect(user_with_duplicate_email).not_to be_valid  
  end
  
  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(email: upcased_email))
    user_with_duplicate_email = User.new(@attr)
    expect(user_with_duplicate_email).not_to be_valid
  end
  
  describe "passwords" do

  	before(:each) do
  		@user = User.new(@attr)
  	end

  	it "should have a password attribute" do
  		expect(@user).to respond_to(:password)
  	end

  	it "should have a password confirmation attribute" do
  		expect(@user).to respond_to(:password_confirmation)
  	end
  end

  describe "password validations" do
    it "should require a password" do
    	expect(User.new(@attr.merge(password: "", password_confirmation: ""))).not_to be_valid
    end

    it "should require a matching password confirmation" do
    	expect(User.new(@attr.merge(password_confirmation: "invalid"))).not_to be_valid
    end

    it "should reject short password" do
    	short = "a" * 5
    	short_password_user = @attr.merge(password: short, password_confirmation: short)
    	expect(User.new(short_password_user)).not_to be_valid
    end

    it "should reject long password" do
    	long = "a" * 41
    	long_password_user = @attr.merge(password: long, password_confirmation: long)
    	expect(User.new(long_password_user)).not_to be_valid
    end
  end

  describe "password encryption" do

		before(:each) do
	  	@user = User.create!(@attr)
	 	end

    it "should have an encrypted password attribute" do
      expect(@user).to respond_to(:encrypted_password)
    end

    it "should set the encrypted_password attribute" do
      expect(@user.encrypted_password).not_to be_blank
    end

    it "should have a salt" do
      expect(@user).to respond_to(:salt)
    end
  end

  describe "#has_password?" do
  	before(:each) do
    @user = User.create!(@attr)
   end

  	it "should exist" do
      expect(@user).to respond_to(:has_password?)
  	end

  	it "should return true if the passwords match" do
  		expect(@user.has_password?(@attr[:password])).to be_truthy
  	end

  	it "should return false if the passwords don't match" do
  		expect(@user.has_password?("invalid")).to be_falsey
  	end
  end

  describe "authenticate method" do
    it "should exist" do
    	expect(User).to respond_to(:authenticate)
    end
    
    it "should return nil on email/password mismatch" do
    	expect(User.authenticate(@attr[:email], "wrongpass")).to be_nil
    end
    
    it "should return nil for an email address with no user" do
      expect(User.authenticate("bar@foo.com", @attr[:password])).to be_nil
    end
    
    it "should return the user on email/password match" do
    	expect(User.authenticate(@attr[:email], @attr[:password])).to be(@user)
    end
  end
end
