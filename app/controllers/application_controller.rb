class ApplicationController < ActionController::Base
  require "browser/aliases"
  Browser::Base.include(Browser::Aliases)
  before_action :set_browser
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_index_path
  end

  def set_browser
    @browser = Browser.new(request.env["HTTP_USER_AGENT"])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :key])
  end
end
