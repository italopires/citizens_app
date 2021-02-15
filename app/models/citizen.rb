class Citizen < ApplicationRecord
  has_one :address

  accepts_nested_attributes_for :address

  validates :full_name, :email, :birthdate, :phone, :picture_file, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validate :cpf_validator

  mount_uploader :picture_file, CitizenUploader

  def cpf=(cpf)
    write_attribute(:cpf, CPF.new(cpf).stripped)
  end

  private

  def cpf_validator
    return if CPF.valid?(cpf)

    errors.add(:cpf, "CPF é inválido")
  end
end