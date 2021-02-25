module TemplateHelper
  def devise_sign_in?
    params[:controller] == 'users/sessions' ? '' : 'display:none;'
  end

  def devise_sign_up?
    params[:controller] == 'users/registrations' ? '' : 'display:none;'
  end

  def new_button_text(text = '')
    return text if text.present?

    t('buttons.new')
  end

  def submit_button_text(text = '')
    return text if text.present?

    t('buttons.submit.text')
  end

  def submit_button_name(name = '')
    return name if name.present?

    'commit'
  end
end
