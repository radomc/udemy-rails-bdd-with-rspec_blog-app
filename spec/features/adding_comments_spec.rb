require 'rails_helper'

RSpec.feature 'Adding Reviews to Articles' do

  before do
    @first_user = User.create(email: 'first_user@example.com', password: 'password')
    @second_user = User.create(email: 'second_user@example.com', password: 'password')

    @article = Article.create(title: 'The first article', body: 'first body', user: @first_user)
  end

  scenario 'permits a signed in user to write a review' do
    login_as(@second_user)

    visit '/'
    click_link @article.title
    fill_in 'New Comment', with: 'First Comment'
    click_button 'Add Comment'

    expect(page).to have_content('Comment has been created')
    expect(page).to have_content('First Comment')
    expect(current_path).to eq(article_path(@article.comments.last.id))
  end
end
