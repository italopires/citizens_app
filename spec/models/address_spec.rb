require 'rails_helper'

RSpec.describe Address do
  context 'relationship' do
    it { is_expected.to belong_to(:citizen) }
    it { is_expected.to belong_to(:state) }
    it { is_expected.to belong_to(:city) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :zipcode }
    it { is_expected.to validate_presence_of :public_place }
    it { is_expected.to validate_presence_of :district }
    it { is_expected.to validate_presence_of :city_id }
    it { is_expected.to validate_presence_of :state_id }
  end
end
