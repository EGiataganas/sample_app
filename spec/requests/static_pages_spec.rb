require 'rails_helper'

RSpec.feature 'Static Pages', type: :feature do

  subject { page }

  describe 'Home Page' do
  	before(:each) { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }
    
    it_behaves_like 'all static pages'
    it_behaves_like 'a page with site links'
    it { is_expected.not_to have_title('Home | ' + full_title) }
    it { is_expected.to have_link('Sign up', href: signup_path)}
  end

  describe 'Contact Page' do
  	before(:each) { visit contact_path }
    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }
    
    it_behaves_like 'all static pages'
    it_behaves_like 'a page with site links'
  end

  describe 'About Us Page' do
  	before(:each) { visit about_path }
    let(:heading)    { 'About Us' }
    let(:page_title) { 'About Us' }
    
    it_behaves_like "all static pages"
    it_behaves_like 'a page with site links'
  end

  describe 'Help Page' do
  	before(:each) { visit help_path }
    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }
    
    it_behaves_like 'all static pages'
    it_behaves_like 'a page with site links'
  end
end