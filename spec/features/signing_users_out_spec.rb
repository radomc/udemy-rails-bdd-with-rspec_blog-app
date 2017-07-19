require 'rails_helper'

RSpec.feature 'Users Sign out' do

  before do
    @user = User.create!(email: 'email@example.com', password: 'password')

    visit '/'

    click_link 'Sign in'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  scenario 'With valid credentials' do
    visit '/'

    click_link 'Sign out'

    expect(page).to have_content('Signed out successfully.')
  end
end
