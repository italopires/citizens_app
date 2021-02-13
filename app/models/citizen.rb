class Citizen < ApplicationRecord
  validates :full_name, :cpf, :email, :birthdate, :phone, :status, presence: true
end