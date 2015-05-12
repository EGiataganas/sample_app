require 'rails_helper'

RSpec.feature 'UserPages', type: :feature do
  subject { page }

  describe 'signup page' do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end
end
