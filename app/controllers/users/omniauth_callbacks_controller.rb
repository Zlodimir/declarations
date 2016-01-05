class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def sign_in_or_redirect
    user = User.from_omniauth(request.env['omniauth.auth'], omniauth_params)
    Rails.logger.debug("EBAT!!!!!!!!!!omniauth_params!!!!#{omniauth_params}")
    Rails.logger.debug("EBAT!!!!!!!!!!request.env['omniauth.auth']!!!!#{request.env['omniauth.auth']}")
    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: request.env['omniauth.auth'].provider.capitalize) if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to root_path
    end
  end

  alias facebook  sign_in_or_redirect
  alias twitter   sign_in_or_redirect
  alias google    sign_in_or_redirect
  alias vkontakte sign_in_or_redirect
  alias mailru    sign_in_or_redirect

  protected

  def omniauth_params
    raw_params = request.env['omniauth.params']
    omniauth_params = ActionController::Parameters.new(raw_params)
  end
end
