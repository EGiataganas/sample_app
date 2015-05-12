require 'rails_helper'
# include ApplicationHelper

RSpec.feature 'Static Pages', type: :feature do

  subject { page }

  shared_examples_for 'all static pages' do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe 'Home Page' do
  	before(:each) { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }
    
    it_should_behave_like 'all static pages'
    it { should_not have_title('Home | ' + full_title) }
  end

  describe 'Contact Page' do
  	before(:each) { visit contact_path }
    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }
    
    it_should_behave_like 'all static pages'
  end

  describe 'About Us Page' do
  	before(:each) { visit about_path }
    let(:heading)    { 'About Us' }
    let(:page_title) { 'About Us' }
    
    it_should_behave_like "all static pages"
  end

  describe 'Help Page' do
  	before(:each) { visit help_path }
    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }
    
    it_should_behave_like 'all static pages'
  end

  it 'should have the right site layout links' do

    visit root_path
    click_link 'Sign up'
    expect(page.current_path).to eq(signup_path)

    click_link 'Home'
    expect(page).to have_link('Home', href: root_path)

    click_link 'Help'
    expect(page).to have_link('Help', href: help_path)

    click_link 'About'
    expect(page).to have_link('About', href: about_path)

    click_link 'Contact'
    expect(page.current_path).to eq(contact_path)

    click_link 'Log in'
    expect(page.current_path).to eq(login_path)
  end
end