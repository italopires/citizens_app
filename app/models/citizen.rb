class Citizen < ApplicationRecord
  validates :full_name, :email, :birthdate, :phone, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validate :cpf_validator

  def cpf=(cpf)
    write_attribute(:cpf, CPF.new(cpf).stripped)
  end

  def cpf_validator
    return if CPF.valid?(cpf)

    errors.add(:cpf, "CPF é inválido")
  end
end