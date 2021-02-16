FactoryBot.define do
  factory :citizen do
    full_name { FFaker::NameBR.name }
    cpf { FFaker::IdentificationBR.cpf }
    email { FFaker::Internet.email }
    birthdate { Date.current.advance(days: -1) }
    phone { FFaker::PhoneNumberBR.phone_number }
    status { true }
    user
    picture_file { Rack::Test::UploadedFile.new(File.join("#{Rails.root}/spec/fixtures/om30.png")) }
  end
end
