require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'devise_sign_in?' do
    before { controller.params[:controller] = controller_name }

    context 'when controller is users/sessions' do
      let(:controller_name) { 'users/sessions' }

      it 'returns blank' do
        expect(helper.devise_sign_in?).to be_blank
      end
    end

    context 'when controller is not users/sessions' do
      let(:controller_name) { 'users/registrations' }

      it 'returns display:none;' do
        expect(helper.devise_sign_in?).to eq 'display:none;'
      end
    end
  end

  describe 'devise_sign_up?' do
    before { controller.params[:controller] = controller_name }

    context 'when controller is users/registrations' do
      let(:controller_name) { 'users/registrations' }

      it 'returns blank' do
        expect(helper.devise_sign_up?).to be_blank
      end
    end

    context 'when controller is not users/registrations' do
      let(:controller_name) { 'users/sessions' }

      it 'returns display:none;' do
        expect(helper.devise_sign_up?).to eq 'display:none;'
      end
    end
  end
end
