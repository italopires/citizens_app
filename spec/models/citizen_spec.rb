require 'rails_helper'

RSpec.describe Citizen do
  context 'relationship' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:state) }
    it { is_expected.to belong_to(:city) }
    it { is_expected.to have_one(:address) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :full_name }
    it { is_expected.to validate_presence_of :cpf }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :birthdate }
    it { is_expected.to validate_presence_of :phone }
    it { is_expected.to validate_presence_of :picture_file }
    it { is_expected.to validate_presence_of :city_id }
    it { is_expected.to validate_presence_of :state_id }

    describe 'email format' do
      context 'when email format is valid' do
        subject { described_class.new(email: 'email@email.com') }

        it 'does not have error to email' do
          subject.valid?

          expect(subject.errors[:email]).to be_empty
        end
      end

      context 'when email format is invalid' do
        subject { described_class.new(email: 'email@.com') }
        it 'has error to email' do
          subject.valid?

          expect(subject.errors[:email]).to eq [I18n.t('errors.messages.invalid')]
        end
      end
    end

    describe 'cpf_validator' do
      context 'when cpf is valid' do
        subject { described_class.new(cpf: '13891931018') }

        it 'does not have error to cpf' do
          subject.valid?

          expect(subject.errors[:cpf]).to be_empty
        end
      end

      context 'when cpf is invalid' do
        subject { described_class.new(cpf: '13891931017') }

        it 'returns custom validation error' do
          subject.valid?

          expect(subject.errors[:cpf]).to eq [I18n.t('errors.messages.invalid')]
        end
      end
    end
  end

  describe 'nested_atributes' do
    it { is_expected.to accept_nested_attributes_for(:address) }
  end

  describe '#cpf=' do
    subject { build(:citizen, cpf: '373.200.150-48').cpf }

    it 'set the cpf' do
      is_expected.to eq '37320015048'
    end
  end
end