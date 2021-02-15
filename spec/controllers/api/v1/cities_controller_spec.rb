require 'rails_helper'

RSpec.describe Api::V1::CitiesController, type: :controller do
  render_views
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET#calculate' do
    let!(:state1) { create(:state, name: 'State1') }
    let!(:state2) { create(:state, name: 'State2') }
    let!(:city1) { create(:city, name: 'City1', state: state1) }
    let!(:city2) { create(:city, name: 'City2', state: state1) }
    let!(:city3) { create(:city, name: 'City3', state: state2) }

    let(:params) { { state_id: state1.id } }

    before { get :index, params: params, format: :json }

    it 'assigns cities that belongs to state', aggregate_failures: true do
      expect(response.body).to match /#{city1.id}/
      expect(response.body).to match /#{city1.name}/
      expect(response.body).to match /#{city2.id}/
      expect(response.body).to match /#{city2.name}/
      expect(response.body).not_to match /#{city3.id}/
      expect(response.body).not_to match /#{city3.name}/
    end

    it 'returns success' do
      expect(response).to be_successful
    end
  end
end