require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe UserSessionsController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    context 'with correct credentials' do
      let!(:user) do
        User.create(
          first_name: 'John',
          last_name: 'Doe',
          email: 'john@doe.com',
          password: 'password1234',
          password_confirmation: 'password1234'
        )
      end

      it 'redirects to the todo list path' do
        post :create, params: { email: 'john@doe.com', password: 'password1234' }
        expect(response).to be_redirect
        expect(response).to redirect_to(todo_lists_path)
      end

      it 'finds the user' do
        expect(User).to receive(:find_by).with(email: 'john@doe.com').and_return(user)
        post :create, params: { email: 'john@doe.com', password: 'password1234' }
      end

      it 'authenticates the user' do
        allow(User).to receive(:find_by).and_return(user)
        expect(user).to receive(:authenticate)
        post :create, params: { email: 'john@doe.com', password: 'password1234' }
      end

      it 'sets the user_id in the session' do
        post :create, params: { email: 'john@doe.com', password: 'password1234' }
        expect(session[:user_id]).to eq(user.id)
      end

      it 'sets the flash success message' do
        post :create, params: { email: 'john@doe.com', password: 'password1234' }
        expect(flash[:success]).to eq('Thanks for signing in!')
      end

      it 'sets the remember_me_token cookie if chosen' do
        expect(cookies).to_not have_key('remember_me_token')
        post :create, params: { email: 'john@doe.com', password: 'password1234', remember_me: '1' }
        expect(cookies).to have_key('remember_me_token')
        expect(cookies['remember_me_token']).to_not be_nil
      end
    end

    shared_examples_for 'denied login' do
      before { post :create, params: { email: email, password: password } }

      it 'renders the new template' do
        expect(response).to render_template('new')
      end

      it 'sets the flash error message' do
        expect(flash[:error]).to eq('There was a problem signing in. Please check your email and password.')
      end
    end

    context 'with blank credentials' do
      let(:email) { '' }
      let(:password) { '' }
      it_behaves_like 'denied login'
    end

    context 'with an incorrect password' do
      let!(:user) do
        User.create(
          first_name: 'John',
          last_name: 'Doe',
          email: 'john@doe.com',
          password: 'password1234',
          password_confirmation: 'password1234'
        )
      end
      let(:email) { user.email }
      let(:password) { 'incorrect' }

      it_behaves_like 'denied login'
    end

    context 'with no email in existence' do
      let(:email) { 'none@found.com' }
      let(:password) { 'incorrect' }

      it_behaves_like 'denied login'
    end
  end

  describe 'DELETE destroy' do
    context 'logged in' do
      before do
        sign_in create(:user)
      end

      it 'returns a redirect' do
        delete :destroy
        expect(response).to be_redirect
      end

      it 'sets the flash message' do
        delete :destroy
        expect(flash[:success]).to_not be_blank
        expect(flash[:success]).to match(/signed out/)
      end

      it 'removes the session[:user_id] key' do
        session[:user_id] = 1
        delete :destroy
        expect(session[:user_id]).to be_nil
      end

      it 'removes the remember_me_token cookie' do
        request.cookies['remember_me_token'] = 'remembered'
        delete :destroy
        expect(cookies).to_not include('remember_me_token')
        expect(response.cookies['remember_me_token']).to be_nil
      end

      it 'resets the session' do
        expect(controller).to receive(:reset_session)
        delete :destroy
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
