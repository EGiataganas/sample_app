require 'rails_helper'

RSpec.feature 'Authentication', type: :feature do

  subject { page }

  describe "signin page" do
    before { visit login_path }

    it { should have_content('Log in') }
    it { should have_title('Log in') }
  end
end