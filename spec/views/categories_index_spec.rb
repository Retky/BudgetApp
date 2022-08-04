require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Categories Index', type: :feature do
  before :each do
    @user = User.new(name: 'John', email: 'jhon@test.com', password: 'password')
    @user.save!
    @category1 = Category.create(name: 'Food', icon: 'https://picsum.photos/200', user_id: @user.id)
    @movement1 = Movement.create(name: 'Hamburger', amount: 36, user_id: @user.id)
    @category_movement1 = CategoryMovement.create(category_id: @category1.id, movement_id: @movement1.id)
    visit new_user_session_path
    fill_in 'Email', with: 'jhon@test.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    visit categories_path
  end

  it 'should show the title' do
    expect(page).to have_content('Categories')
  end

  it 'should show a Log Out button' do
    expect(page).to have_content('Log Out')
  end

  it 'should show the categories' do
    expect(page).to have_content('Food')
  end

  it 'should show the amount of the category' do
    expect(page).to have_content('$ 36.0')
  end

  it 'should have a button to add a new category' do
    expect(page).to have_content('New Category')
  end

  it 'should redirect to the new category page when the button is clicked' do
    click_on('New Category')
    expect(page).to have_content('New Category')
  end

  it 'should redirect to the category page when the button is clicked' do
    click_on('Food')
    expect(page).to have_content('Food Movements')
  end
end
