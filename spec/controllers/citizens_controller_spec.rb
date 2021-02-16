require 'rails_helper'

RSpec.describe CitizensController do
  let!(:user) { create(:user) }
  let!(:citizen1) { create(:citizen, user: user) }

  before { sign_in user }

  describe 'GET #index' do
    let!(:citizen2) { create(:citizen, user: user) }

    before { get :index }

    it 'assigns objects' do
      expect(assigns(:citizen_presenter).searched_citizens).to contain_exactly citizen1, citizen2
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns object' do
      expect(assigns(:object)).to be_a_new(Citizen)
    end

    it 'render new template' do
      expect(response).to render_template('citizens/new')
    end
  end

  describe 'POST #create' do
    let(:params) { attributes_for(:citizen) }

    it 'creates a new Citizen' do
      expect { post :create, params: { citizen: params } }.to change(Citizen, :count).by(1)
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: citizen1.id } }

    it 'render new template' do
      expect(response).to render_template('citizens/edit')
    end
  end

  describe 'PUT #update' do
    let!(:params) { attributes_for(:citizen, full_name: 'Test Citizen') }

    it 'updates an existent Citizen' do
      expect { put(:update, params: { id: citizen1.id, citizen: params }); citizen1.reload }.to change(citizen1, :attributes)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroy an existent Citizen' do
      expect { delete :destroy, params: { id: citizen1.id } }.to change(Citizen, :count).by(-1)
    end
  end
end