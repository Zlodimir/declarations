class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_rss_feed

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

  def authenticate_admin!
    if user_signed_in? 
      unless current_user.is_admin
        redirect_to root_path(), alert: t('messages.user.restrict_access')
      end
    else
      redirect_to new_user_session_path
    end
  end

  def get_rss_feed
    url = 'https://news.yandex.ru/auto.rss'
    @feed = Feedjira::Feed.fetch_and_parse url
  end
end
