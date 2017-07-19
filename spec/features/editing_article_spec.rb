require 'rails_helper'

RSpec.feature 'Editing an Articles' do

  before do
    @user = User.create!(email: 'email@example.com', password: 'password')
    login_as(@user)
    @article = Article.create(title: 'The first article', body: 'first body', user: @user)
  end

  scenario 'An user updates an article' do
    visit '/'

    click_link @article.title
    click_link 'Edit Article'

    fill_in 'Title', with: 'Updated Article'
    fill_in 'Body', with: 'Updated body of article'
    click_button 'Update Article'

    expect(page).to have_content('Article has been updated')
    expect(page.current_path).to eq(article_path(@article))
  end

  scenario 'An user fails to update an article' do
    visit '/'

    click_link @article.title
    click_link 'Edit Article'

    fill_in 'Title', with: ''
    fill_in 'Body', with: 'Updated body of article'
    click_button 'Update Article'

    expect(page).to have_content('Article has not been updated')
    expect(page.current_path).to eq(article_path(@article))
  end
end
