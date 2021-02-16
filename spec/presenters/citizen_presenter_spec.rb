require 'rails_helper'

RSpec.describe CitizenPresenter do
  let!(:user) { create(:user) }
  let(:state1) { create(:state) }
  let(:city1) { create(:city) }
  let(:address1) do
    build(:address, zipcode: '64000-350', public_place: 'public_place1', complement: 'complement1',
          district: 'district1', ibge_code: '123', state: state1, city: city1)
  end

  let(:address2) do
    build(:address, zipcode: '64000-250', public_place: 'public_place2', complement: 'complement2',
                         district: 'district2', ibge_code: '456', state: state1, city: city1)
  end

  let!(:citizen1) do
    create(:citizen, user: user, full_name: 'full_name1', email: 'citizen1@citizen.com', birthdate: 1.year.ago,
           cpf: '19164433030', phone: '(86)33333333', status: true, address: address1)
  end

  let!(:citizen2) do
    create(:citizen, user: user, full_name: 'full_name2', email: 'citizen2@citizen.com',birthdate: 2.year.ago,
           cpf: '65439138005', phone: '(86)33332222', status: true, address: address2)
  end

  describe '#searched_citizens' do
    subject { described_class.new(user: user, params: params).searched_citizens }

    context 'without q param' do
      let(:params) { { } }

      it { is_expected.to contain_exactly(citizen1, citizen2) }
    end

    context 'with q param' do
      context 'when full_name_cont is present' do
        let(:params) { { full_name_cont: 'full_name1' } }

        it { is_expected.to contain_exactly(citizen1) }
      end

      context 'when email_cont is present' do
        let(:params) { { email_cont: 'citizen2@citizen.com' } }

        it { is_expected.to contain_exactly(citizen2) }
      end

      context 'when birthdate_eq is present' do
        let(:params) { { birthdate_eq: 2.year.ago } }

        it { is_expected.to contain_exactly(citizen2) }
      end

      context 'when cpf_cont is present' do
        let(:params) { { cpf_cont: '19164433030' } }

        it { is_expected.to contain_exactly(citizen1) }
      end

      context 'when phone_cont is present' do
        let(:params) { { phone_cont: '(86)33332222' } }

        it { is_expected.to contain_exactly(citizen2) }
      end

      context 'when status_in is present' do
        let(:params) { { status_in: false } }

        it { is_expected.to be_empty }
      end

      context 'when address_zipcode_cont is present' do
        let(:params) { { address_zipcode_cont: '64000-350' } }

        it { is_expected.to contain_exactly(citizen1) }
      end
    end
  end
end