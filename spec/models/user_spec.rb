require 'rails_helper'

RSpec.describe User do
  context 'relationship' do
    it { is_expected.to have_many(:citizens).dependent(:destroy) }
  end
end
