require 'rails_helper'
require 'support/macros'

RSpec.describe ArticlesController, type: :controller do

  describe "GET #edit" do
    before do
      @first_user = User.create(email: 'first_user@example.com', password: 'password')
    end

    context 'owner is allowed to edit his articles' do
      it 'renders the edit template' do 
        login_user @first_user
        article = Article.create(title: 'The first article', body: 'first body', user: @first_user)

        get :edit, params: { id: article }
        assert_response :success
      end
    end

    context 'non-owner is not allowed to edit other users articles' do
      it 'redirects to the root path' do 
        second_user = User.create(email: 'second_user@example.com', password: 'password')

        login_user second_user

        article = Article.create(title: 'The first article', body: 'first body', user: @first_user)

        get :edit, params: { id: article }

        assert_response :redirect
        message = 'You can only edit your own article.'
        expect(flash[:danger]).to eq message
      end
    end

    it "returns http success" do
      get :index
      assert_response :success
    end
  end

end
