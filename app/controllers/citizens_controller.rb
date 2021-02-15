class CitizensController < BaseController
  before_action :set_states, only: [:new, :create, :edit, :update]
  before_action :set_cities, only: [:new, :create, :edit, :update]

  def index
    @citizen_presenter = CitizenPresenter.new(user: current_user, params: params[:q])
  end

  def new
    @object = object_class.new
    @object.build_address
  end

  private

  def permitted_params
    params.require(:citizen).permit(:full_name, :cpf, :email, :birthdate, :phone, :status, :picture_file,
                                    :city_id, :state_id,
                                    address_attributes: [:id, :zipcode, :public_place, :district, :ibge_code,
                                    :complement]).merge!(user_id: current_user.id)
  end

  def after_save_path
    citizens_path
  end

  def set_states
    @states = State.order(:name)
  end

  def set_cities
    @cities = City.order(:name)
  end
end