require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Movements New', type: :feature do
  before :each do
    @user = User.new(name: 'John', email: 'jhon@test.com', password: 'password')
    @user.save!
    @category1 = Category.create(name: 'Food', icon: 'https://picsum.photos/200', author_id: @user.id)
    @movement1 = Movement.create(name: 'Hamburger', amount: 36, user_id: @user.id)
    @category_movement1 = CategoryMovement.create(category_id: @category1.id, movement_id: @movement1.id)
    visit new_user_session_path
    fill_in 'Email', with: 'jhon@test.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    visit new_movement_path
  end

  it 'should show the title' do
    expect(page).to have_content('New Movement')
  end

  it 'should have a field to enter the name of the movement' do
    expect(page).to have_field('movement_name')
  end

  it 'should have a field to enter the amount of the movement' do
    expect(page).to have_field('movement_amount')
  end

  it 'should have a field to select the category of the movement' do
    expect(page).to have_content('Food')
  end

  it 'should save the movement when the button is clicked' do
    fill_in 'movement_name', with: 'Hamburger2'
    fill_in 'movement_amount', with: '36'
    check(page.all('checkbox')[0])
    click_on 'Save'
    click_on 'Food'

    expect(page).to have_content('Hamburger2')
  end
end
