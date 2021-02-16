require 'rails_helper'

RSpec.describe CitizenMailer do
  let!(:citizen) { create(:citizen) }

  describe '.new_citizen' do
    subject(:mail) { described_class.new_citizen(citizen) }

    context 'subject' do
      subject { mail.subject }

      it { is_expected.to eq 'Cidadão Cadastrado - OM30' }
    end

    context 'from' do
      subject { mail.from }

      it { is_expected.to contain_exactly 'italopiresdev@gmail.com' }
    end

    context 'to' do
      subject { mail.to }

      it { is_expected.to contain_exactly citizen.email }
    end

    context 'body', aggregate_failures: true do
      subject { mail.body }

      it { is_expected.to match /Seu cadastro como Munícipe foi criado com o email <strong>#{citizen.email}<\/strong>./ }
      it { is_expected.to match /Seja Bem vindo./ }
    end
  end

  describe '.update_citizen_status' do
    subject(:mail) { described_class.update_citizen_status(citizen) }

    context 'subject' do
      subject { mail.subject }

      it { is_expected.to eq 'Atualização do Status do Munícipe - OM30' }
    end

    context 'from' do
      subject { mail.from }

      it { is_expected.to contain_exactly 'italopiresdev@gmail.com' }
    end

    context 'to' do
      subject { mail.to }

      it { is_expected.to contain_exactly citizen.email }
    end

    context 'body', aggregate_failures: true do
      subject { mail.body }

      it { is_expected.to match /O seu status como/ }
      it { is_expected.to match /foi alterado para <strong>Ativo<\/strong>./ }
      it { is_expected.to match /Obrigado,<br>OM30/ }
    end
  end

  describe '.update_citizen' do
    subject(:mail) { described_class.update_citizen(citizen) }

    context 'subject' do
      subject { mail.subject }

      it { is_expected.to eq 'Atualização dos Dados do Munícipe - OM30' }
    end

    context 'from' do
      subject { mail.from }

      it { is_expected.to contain_exactly 'italopiresdev@gmail.com' }
    end

    context 'to' do
      subject { mail.to }

      it { is_expected.to contain_exactly citizen.email }
    end

    context 'body', aggregate_failures: true do
      subject { mail.body }

      it { is_expected.to match /O seus dados como Munícipe foram <strong>Atualizados<\/strong>./ }
      it { is_expected.to match /Obrigado,<br>OM30/ }
    end
  end
end