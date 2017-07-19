require 'rails_helper'

RSpec.feature 'Users Sign-in' do

  before do
    @user = User.create!(email: 'email@example.com', password: 'password')
  end

  scenario 'With valid credentials' do
    visit '/'

    click_link 'Sign in'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    expect(page).to have_content("Signed in as #{@user.email}")
  end
end
