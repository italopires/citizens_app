require 'rails_helper'

RSpec.describe TemplateHelper, type: :helper do
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

  describe 'new_button_text' do
    context 'when text is present' do
      it 'returns button_description' do
        expect(helper.new_button_text('button_text')).to eq 'button_text'
      end
    end

    context 'when text is not present' do
      it 'returns default text' do
        expect(helper.new_button_text).to eq t('buttons.new')
      end
    end
  end

  describe 'submit_button_text' do
    context 'when text is present' do
      it 'returns button_description' do
        expect(helper.submit_button_text('button_text')).to eq 'button_text'
      end
    end

    context 'when text is not present' do
      it 'returns default text' do
        expect(helper.submit_button_text).to eq t('buttons.submit.text')
      end
    end
  end

  describe 'submit_button_name' do
    context 'when text is present' do
      it 'returns button_description' do
        expect(helper.submit_button_name('button_text')).to eq 'button_text'
      end
    end

    context 'when text is not present' do
      it 'returns default text' do
        expect(helper.submit_button_name).to eq 'commit'
      end
    end
  end
end
