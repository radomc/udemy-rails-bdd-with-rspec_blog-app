require 'rails_helper'

RSpec.feature 'Deleting an Articles' do

  before do
    @user = User.create!(email: 'email@example.com', password: 'password')
    login_as(@user)
    @article = Article.create(title: 'The first article', body: 'first body', user: @user)
  end

  scenario 'An user deletes an article' do
    visit '/'

    click_link @article.title
    click_link 'Delete Article'

    expect(page).to have_content('Article has been deleted')
    expect(page.current_path).to eq(articles_path)
  end
end
