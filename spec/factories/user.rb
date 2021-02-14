FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { "useR123*" }
  end
end