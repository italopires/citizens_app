require 'rails_helper'

RSpec.describe City do
  context 'relationship' do
    it { is_expected.to belong_to :state }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :name }
  end
end
