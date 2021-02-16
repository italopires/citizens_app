FactoryBot.define do
  factory :address do
    zipcode { FFaker::AddressBR.zip_code }
    public_place { FFaker::AddressBR.secondary_address }
    district { FFaker::AddressBR.neighborhood }
    city
    state
  end
end


