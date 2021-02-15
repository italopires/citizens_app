class CitizenPresenter
  def initialize(user:, params:)
    @user = user
    @params = params
  end

  def searched_citizens
    @searched_citizens ||= ransack.result
  end

  def ransack
    @ransack ||= Citizen.all.ransack(@params)
  end
end