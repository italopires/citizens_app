class Citizen < ApplicationRecord
  belongs_to :user
  belongs_to :state
  belongs_to :city

  has_one :address

  accepts_nested_attributes_for :address

  validates :full_name, :email, :cpf, :birthdate, :phone, :picture_file, :city_id, :state_id, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
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