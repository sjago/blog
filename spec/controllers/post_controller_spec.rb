require 'rails_helper'

describe PostsController do
  describe '#show' do
    context 'when the post is found' do
      let(:post) { create(:post) }
      it 'renders the show page' do
        get :show, id: post.id

        expect(response).to render_template(:show)
      end
    end

    context 'when using a slug' do
      let(:post) { create(:post, slug: 'my-slug') }
    end


    context 'when the post is not found' do
      it 'renders a 404 page' do
        get :show, id: 2

        expect(response).to render_template('shared/not_found')
        expect(response.status).to eq(404)
      end
    end

    describe '#create' do
      context 'when the post is successfully created' do
        let(:user) { create(:user) }

        

        let(:valid_params) do
          {
            post:{
              title: 'Title',
              content: 'Content is way too short'
            }
          }
        end

        it 'creates the post' do
          expect {
            post :create, valid_params, { user_id: user.id }
          }.to change(Post, :count).by(1)
        end
        
        it 'redirects to the created post' do
          post :create, valid_params, { user_id: user.id }
          expect(response).to redirect_to(post_path(Post.last))
        end
      end

      context 'when the post fails validation' do
        let(:user) { create(:user) }

        let(:invalid_params) do
          {
            post:{
              title: '',
              content: 'Content'
            }
          }
        end

        it 'does not creat post' do
          expect {
            post :create, invalid_params, { user_id: user.id }
          }.not_to change(Post, :count)
        end

        it 'renders new template' do
          post :create, invalid_params, {user_id: user.id }
          expect(response).to render_template(:new)
        end
      end
    end
  end
end