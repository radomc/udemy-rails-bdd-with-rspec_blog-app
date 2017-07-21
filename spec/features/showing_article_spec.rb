require 'rails_helper'

RSpec.feature 'Showing an Article' do

  before do
    @first_user = User.create(email: 'first_user@example.com', password: 'password')
    @second_user = User.create(email: 'second_user@example.com', password: 'password')
    @article = Article.create(title: 'The first article', body: 'first body', user: @first_user)
  end

  scenario 'A non-signed in user does not see Edit or Delete links' do
    visit '/'

    click_link @article.title

    expect(page).not_to have_link('Edit Article')
    expect(page).not_to have_link('Delete Article')
  end

  scenario 'A non-owner signed in does not see Edit or Delete links' do
    login_as(@second_user)

    visit '/'

    click_link @article.title

    expect(page).not_to have_link('Edit Article')
    expect(page).not_to have_link('Delete Article')
  end

  scenario 'A signed in owner sees Edit or Delete links' do
    login_as(@first_user)

    visit '/'

    click_link @article.title

    expect(page).to have_link('Edit Article')
    expect(page).to have_link('Delete Article')
  end

  scenario 'Display individual article' do
    visit '/'

    click_link @article.title
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end
