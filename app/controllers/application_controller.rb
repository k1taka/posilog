class ApplicationController < ActionController::Base
  before_action :configure_user_permitted_parameters, if: :devise_controller?
  before_action :configure_store_permitted_parameters, if: :devise_controller?

  def configure_user_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:image,:profile])
  end
  def configure_store_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:url,:kind,:profile])
  end
end
