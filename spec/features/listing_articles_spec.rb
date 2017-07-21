require 'rails_helper'

RSpec.feature 'Listing Articles' do
  
  before do
    @user = User.create!(email: 'email@example.com', password: 'password')
    @first_article = Article.create(title: 'The first article', body: 'first body', user: @user)
    @second_article = Article.create(title: 'The second article', body: 'second body', user: @user)
  end

  scenario 'List All Articles' do
    visit '/'

    expect(page).to have_link(@first_article.title)
    expect(page).to have_content(@first_article.title)
    expect(page).to have_content(@first_article.body)

    expect(page).to have_link(@second_article.title)
    expect(page).to have_content(@second_article.title)
    expect(page).to have_content(@second_article.body)

    expect(page).not_to have_link('New Article')
  end

end
