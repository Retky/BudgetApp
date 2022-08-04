require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Categories New', type: :feature do
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

    visit new_category_path
  end

  it 'should show the title' do
    expect(page).to have_content('New Category')
  end

  it 'should have a field to enter the name of the category' do
    expect(page).to have_field('category_name')
  end

  it 'should have a field to enter the icon of the category' do
    expect(page).to have_field('category_icon')
  end

  it 'should save the category when the button is clicked' do
    fill_in 'category_name', with: 'Food2'
    fill_in 'category_icon', with: 'https://picsum.photos/200'
    click_on 'Save'
    expect(page).to have_content('Food2')
  end
end
