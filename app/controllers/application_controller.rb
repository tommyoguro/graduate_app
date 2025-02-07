class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Deviseのマッピングを正しく認識するために追加
  before_action :set_devise_mapping

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :name_kana, :division_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :name_kana, :company_name, :division_name])
  end
  
  def set_devise_mapping
    request.env["devise.mapping"] = Devise.mappings[:user]
  end
end