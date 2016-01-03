# Fix "unpermitted parameters"  devise & rails 4 strong parameters issue
class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :surname, :username, :email, :avatar)
    devise_parameter_sanitizer.for(:account_update).push(:name, :surname, :email, :avatar)
  end

  protected

  def after_update_path_for(resource)
    user_path(current_user)
  end

  def after_sign_up_path_for(resource)
    root_path
  end
end