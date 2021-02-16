require 'rails_helper'

RSpec.describe UpdateCitizenEmailGenerator do
  let!(:citizen) { create(:citizen) }

  describe '.perform' do
    let(:instance) { double(:instance) }

    it 'instantiates and calls perform' do
      expect(described_class).to receive(:new).with(citizen: citizen).and_return(instance)
      expect(instance).to receive(:perform)

      described_class.perform(citizen: citizen)
    end
  end

  describe '#perform' do
    subject { described_class.new citizen: citizen }

    context 'when citizen status changes' do
      it 'returns subject with Status' do
        citizen.update(status: false)

        expect(subject.perform.subject).to eq 'Atualização do Status do Munícipe - OM30'
      end
    end

    context 'when citizen data changes' do
      it 'returns subject with Dados' do
        citizen.update(full_name: 'New Full Name')

        expect(subject.perform.subject).to eq 'Atualização dos Dados do Munícipe - OM30'
      end
    end
  end
end