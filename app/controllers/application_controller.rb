class ApplicationController < ActionController::Base
  add_flash_types :danger, :info, :warning, :success, :messages
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  @title_page = 'Explora'

  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name phone_number document_number user_type photo])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name phone_number document_number user_type photo])
  end

end
