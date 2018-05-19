require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:session_user) { create(:user) }
  let(:valid_attributes) { attributes_for(:user) }
  let(:invalid_attributes) { {} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { { user_id: session_user.id } }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: session_user.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: session_user.id }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new User' do
        expect do
          post :create, params: { user: valid_attributes },
                        session: valid_session
        end.to change(User, :count).by(1)
      end

      it 'redirects to the created user' do
        post :create, params: { user: valid_attributes }, session: valid_session
        expect(response).to redirect_to(User.last)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_email) { 'new@example.com' }
      let(:new_attributes) do
        { email: new_email, password: 'newpassword' }
      end

      it 'updates the requested user' do
        put :update, params: { id: session_user.id, user: new_attributes },
                     session: valid_session
        session_user.reload
        expect(session_user.email).to eq new_email
      end

      it 'redirects to the user' do
        put :update, params: { id: session_user.id, user: valid_attributes },
                     session: valid_session
        expect(response).to redirect_to(session_user)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user' do
      expect do
        delete :destroy, params: { id: session_user.id }, session: valid_session
      end.to change(User, :count).by(-1)
    end

    it 'redirects to the users list' do
      delete :destroy, params: { id: session_user.id }, session: valid_session
      expect(response).to redirect_to(users_url)
    end
  end
end
