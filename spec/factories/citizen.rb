FactoryBot.define do
  factory :citizen do
    full_name { FFaker::NameBR.name }
    cpf { FFaker::IdentificationBR.cpf }
    email { FFaker::Internet.email }
    birthdate { FFaker::Time.date }
    phone { FFaker::PhoneNumberBR.phone_number }
    status { true }
  end
end
