module ApplicationHelper
  def devise_sign_in?
    params[:controller] == 'users/sessions' ? '' : 'display:none;'
  end

  def devise_sign_up?
    params[:controller] == 'users/registrations' ? '' : 'display:none;'
  end
end
