class CitizensController < BaseController
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
                                    address_attributes: [:id, :zipcode, :public_place, :district, :ibge_code,
                                    :complement])
  end

  def after_save_path
    citizens_path
  end
end