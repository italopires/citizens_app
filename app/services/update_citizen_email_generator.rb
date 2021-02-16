class UpdateCitizenEmailGenerator
  def initialize(citizen: citizen)
    @citizen = citizen
  end

  def self.perform(citizen: citizen)
    new(citizen: citizen).perform
  end

  def perform
    return CitizenMailer.update_citizen_status(@citizen).deliver_now if @citizen.status_before_last_save.present?

    CitizenMailer.update_citizen(@citizen).deliver_now
  end
end