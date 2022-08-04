require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Splash Index', type: :feature do
  before :each do
    @user = User.new(name: 'John', email: 'jhon@test.com', password: 'password')
    @user.save!

    visit root_path
  end

  it 'should welcome the user' do
    expect(page).to have_content('Welcome')
  end

  it 'should have the App name' do
    expect(page).to have_content('Budged Flex')
  end

  it 'should have a link to the login page' do
    expect(page).to have_content('Log In')
  end

  it 'should have a link to the sign up page' do
    expect(page).to have_content('Sign Up')
  end

  it 'should redirect to the login page if the user clicks the log in link' do
    click_on('Log In')
    expect(page).to have_content('Log in')
  end

  it 'should redirect to the sign up page if the user clicks the sign up link' do
    click_on('Sign Up')
    expect(page).to have_content('Sign up')
  end

  it 'should show the user name when the user is logged in' do
    visit new_user_session_path
    fill_in 'Email', with: 'jhon@test.com'
    fill_in 'Password', with: 'password'
    click_on('Log in')

    expect(page).to have_content('John')
  end

  it 'should show Access button when the user is logged in' do
    visit new_user_session_path
    fill_in 'Email', with: 'jhon@test.com'
    fill_in 'Password', with: 'password'
    click_on('Log in')

    expect(page).to have_content('Access')
  end

  it 'should redirect to Categories page if the user clicks the Access button' do
    visit new_user_session_path
    fill_in 'Email', with: 'jhon@test.com'
    fill_in 'Password', with: 'password'
    click_on('Log in')
    click_on('Access')

    expect(page).to have_content('Categories')
  end
end
