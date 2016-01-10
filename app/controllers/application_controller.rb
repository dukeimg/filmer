class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale
  before_action :authenticate_user!

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  private

  def set_locale
    I18n.locale = http_accept_language.preferred_language_from(I18n.available_locales)
  end

end


