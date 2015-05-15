# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

require 'rails_helper'

RSpec.describe User, type: :model do

  before do 
    @user = User.new({ 
      name: "Example User",
      email: "user@example.com",
      password: "foobar",
      password_confirmation: "foobar" })
  end

  subject { @user }

  it { should respond_to(:name)} #require a name
  it { should respond_to(:email)} #require an email
  it { should respond_to(:password_digest) } #require a password
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  context "name" do
    describe "when name is not present" do
      before { @user.name = " " }
      it { should_not be_valid}
    end

    describe "when email is not present" do
      before { @user.email = " " }
      it { should_not be_valid}
    end

    describe "when name is too long" do
      before { @user.name = "a" * 51 }
      it { should_not be_valid }
    end
  end

  context "email" do
    describe "when email format is invalid" do
      it "should be invalid" do
        addresses = %w[user@foo,com user_at_foo..org example.user@foo.]
        addresses.each do |invalid_address|
          @user.email = invalid_address
          expect(@user).not_to be_valid
        end
      end
    end

    describe "when email format is valid" do
      it "should accept valid email addresses" do
        addresses = %w[user@foo.com A_US-ER@foo.bar.org a+b@baz.cn first.last@foo.jp]
        addresses.each do |valid_address|
          @user.email = valid_address
        expect(@user).to be_valid
        end
      end
    end
    
    describe "email address with mixed case" do
      let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

      it "should be saved as all lower-case" do
        @user.email = mixed_case_email
        @user.save
        expect(@user.reload.email).to eq mixed_case_email.downcase
      end
    end
    
    describe "when email address is already taken even if its identical to upcase" do
      before do
        user_with_same_email = @user.dup
        user_with_same_email.email = @user.email.upcase
        user_with_same_email.save
      end

      it { should_not be_valid }
    end
  end

  context "password" do
    describe "when password is not present" do
      before do
        @user = User.new(name: "Example User", email: "user@example.com",
                         password: " ", password_confirmation: " ")
      end
      it { should_not be_valid }
    end

    describe "when password doesn't match confirmation" do
      before { @user.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end

    describe "with a password that's too short" do
      before { @user.password = @user.password_confirmation = "a" * 5 }
      it { should be_invalid }
    end

    describe "with a password that's too long" do
      before { @user.password = @user.password_confirmation = "a" * 41 }
      it { should be_invalid }
    end

    describe "return value of authenticate method" do
      before { @user.save }
      let(:found_user) { User.find_by_email(@user.email) }

      describe "with valid password" do
        it { should eq found_user.authenticate(@user.password) }
      end

      describe "with invalid password" do
        let(:user_for_invalid_password) { found_user.authenticate("invalid") }

        it { should_not eq user_for_invalid_password }
        specify { expect(user_for_invalid_password).to be_falsey }
      end
    end
  end

  # Dan's
  # it { is_expected.to validate_presence_of :name }
  # it { is_expected.to ensure_length_of(:name).is_at_most(50) }

  # %i<name email>.each do |public_attribute|
  #   it { is_expected.to respond_to public_attribute }
  # end
end