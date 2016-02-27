class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :surname,:username, :email, :avatar)
    devise_parameter_sanitizer.for(:account_update).push(:name, :surname, :email, :avatar)
  end

  def set_locale
    I18n.locale = http_accept_language.preferred_language_from(I18n.available_locales)
  end

end


