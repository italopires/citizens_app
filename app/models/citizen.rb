class Citizen < ApplicationRecord
  validates :full_name, :email, :birthdate, :phone, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
end