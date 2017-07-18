require 'rails_helper'

RSpec.feature 'Listing Articles' do
  
  before do
    @first_article = Article.create(title: 'The first article', body: 'first body')
    @second_article = Article.create(title: 'The second article', body: 'second body')
  end

  scenario 'List All Articles' do
    visit '/'

    expect(page).to have_link(@first_article.title)
    expect(page).to have_content(@first_article.title)
    expect(page).to have_content(@first_article.body)

    expect(page).to have_link(@second_article.title)
    expect(page).to have_content(@second_article.title)
    expect(page).to have_content(@second_article.body)
  end

end
