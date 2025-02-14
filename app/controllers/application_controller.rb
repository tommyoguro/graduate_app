class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Deviseのマッピングを正しく認識するために追加
  # before_action :set_devise_mapping

  protect_from_forgery with: :exception
  # # Deviseのログアウト後のリダイレクト先を変更
  # def after_sign_out_path_for(resource_or_scope)
  #  new_user_session_path # ログアウト後にログインページへ遷移
  # end

  private

  def debug_current_user
    Rails.logger.debug "current_user: #{current_user&.inspect}"
  end

  def after_sign_in_path_for(resource)
    menu_index_path # ログイン後の遷移先を変更
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :name_kana, :division_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :name_kana, :company_name, :division_name])
  end

  # def set_devise_mapping
  #   request.env["devise.mapping"] = Devise.mappings[:user]
  # end

  # # 🔹 ログイン後の遷移先をメニュー画面に設定
  # def after_sign_in_path_for(resource)
  #   menu_path # メニュー画面へリダイレクト
  # end
end
