require 'rails_helper'

RSpec.describe Citizen do
  context 'validations' do
    it { is_expected.to validate_presence_of :full_name }
    it { is_expected.to validate_presence_of :cpf }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :birthdate }
    it { is_expected.to validate_presence_of :phone }
  end
end