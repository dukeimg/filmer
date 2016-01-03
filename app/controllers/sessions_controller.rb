class SessionsController < Devise::SessionsController
  before_filter :configure_permitted_parameters

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in).push(:username)
  end
end