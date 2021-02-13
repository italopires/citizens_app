class Citizen < ApplicationRecord
  validates :full_name, :cpf, :email, :birthdate, :phone, presence: true
end