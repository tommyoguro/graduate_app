class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :name_kana, :division_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :name_kana, :company_name, :division_name])
  end
end