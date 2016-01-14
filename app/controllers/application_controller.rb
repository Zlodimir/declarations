class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #http_basic_authenticate_with name: 'user', password: '1dkjJsdlf_s' if Rails.env.production?

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  include Concerns::ErrorsHandler

  before_action :set_session

  def set_session
    gon.session_id = session[:session_id]
  end

  def configure_permitted_parameters
    %i(email username account_role location).each do |field|
      devise_parameter_sanitizer.for(:sign_up) << field
    end
    devise_parameter_sanitizer.for(:sign_up) << { location_details: [:formatted_address, :city, :country, :latitude, :longitude, :place_id] }

    devise_parameter_sanitizer.for(:sign_in) << :login
  end
end
