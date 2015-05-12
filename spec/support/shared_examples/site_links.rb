RSpec.shared_examples_for 'a page with site links' do
  describe 'nav bar' do
    it { is_expected.to  have_link('Home', href: root_path)}
    it { is_expected.to  have_link('Help', href: help_path)}
    it { is_expected.to  have_link('Log in', href: login_path)}
  end

  describe 'footer bar' do
    it { is_expected.to  have_link('About', href: about_path)}
    it { is_expected.to  have_link('Contact', href: contact_path)}
    it { is_expected.to  have_link('News', href: "http://news.railstutorial.org/")}
  end
end