class Citizen < ApplicationRecord
  belongs_to :user

  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :address

  validates :full_name, :birthdate, :phone, :picture_file, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  validate :cpf_validator

  mount_uploader :picture_file, CitizenUploader

  def cpf=(cpf)
    write_attribute(:cpf, CPF.new(cpf).stripped)
  end

  private

  def cpf_validator
    return if cpf.blank? || CPF.valid?(cpf)

    errors.add(:cpf, I18n.t('errors.messages.invalid'))
  end
end