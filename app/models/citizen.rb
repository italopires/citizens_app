class Citizen < ApplicationRecord
  belongs_to :user

  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :address

  validates :full_name, :cpf, :birthdate, :phone, :picture_file, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  validate :valid_cpf
  validate :unique_cpf
  validate :valid_birthdate

  mount_uploader :picture_file, CitizenUploader

  def cpf=(cpf)
    write_attribute(:cpf, CPF.new(cpf).stripped)
  end

  private

  def valid_cpf
    return if cpf.blank? || CPF.valid?(cpf)

    errors.add(:cpf, I18n.t('errors.messages.invalid'))
  end

  def valid_birthdate
    return unless birthdate.present? && birthdate >= Date.current

    errors.add(:birthdate, "Data deve ser anterior à atual")
  end

  def unique_cpf
    return if cpf.blank?

    unless self.new_record?
      citizens = Citizen.where.not(id: self.id).map(&:cpf)
    else
      citizens = Citizen.where(cpf: self.cpf).map(&:cpf)
    end

    errors.add(:cpf, 'Já está em uso') if citizens.include? self.cpf
  end
end