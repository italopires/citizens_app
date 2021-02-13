class CitizensController < BaseController
  private

  def permitted_params
    params.require(:citizen).permit!(:full_name, :cpf, :email, :birthdate, :phone, :status)
  end

  def after_save_path
    citizens_path
  end
end