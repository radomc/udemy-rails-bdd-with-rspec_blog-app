require 'rails_helper'

RSpec.feature 'Showing an Article' do

  before do
    @user = User.create!(email: 'email@example.com', password: 'password')
    @article = Article.create(title: 'The first article', body: 'first body', user: @user)
  end

  scenario 'Display individual article' do
    visit '/'

    click_link @article.title
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end
