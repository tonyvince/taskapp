require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let!(:task) { create(:task) }
  let(:session_user) { task.user }
  let(:valid_attributes) { attributes_for(:task) }
  let(:invalid_attributes) { {} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TasksController. Be sure to keep this updated too.
  let(:valid_session) { { user_id: session_user.id } }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: task.id }, session: valid_session
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
      get :edit, params: { id: task.id }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Task' do
        expect {
          post :create, params: { task: valid_attributes },
                        session: valid_session
        }.to change(Task, :count).by(1)
      end

      it 'redirects to the created task' do
        post :create, params: { task: valid_attributes },
                      session: valid_session
        expect(response).to redirect_to(Task.last)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_description) { 'New Description' }
      let(:new_attributes) do
        { start_time: Time.current, end_time: 2.hours.from_now,
          description: new_description }
      end

      it 'updates the requested task' do
        put :update, params: { id: task.id, task: new_attributes },
                     session: valid_session
        task.reload
        expect(task.description).to eq new_description
      end

      it 'redirects to the task' do
        put :update, params: {id: task.id, task: valid_attributes},
                     session: valid_session
        expect(response).to redirect_to(task)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested task' do
      expect do
        delete :destroy, params: { id: task.id }, session: valid_session
      end.to change(Task, :count).by(-1)
    end

    it 'redirects to the tasks list' do
      delete :destroy, params: { id: task.to_param }, session: valid_session
      expect(response).to redirect_to(tasks_url)
    end
  end
end
