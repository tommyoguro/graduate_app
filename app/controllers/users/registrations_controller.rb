# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  #登録完了画面用のアクション
  def complete #追加
  end #追加  

  protected 

  # 新規登録後の遷移先を変更
  def after_sign_up_path_for(resource)
    registration_complete_path # ダッシュボード画面にリダイレクト（適宜変更）
  end

  # アカウント更新後の遷移先を変更
  def after_update_path_for(resource)
    user_profile_path(resource) # プロフィール画面へリダイレクト（適宜変更）
  end

   # ユーザー登録後のリダイレクト先を変更追加
   def after_sign_up_path_for(resource)
    registration_complete_path # 登録完了画面へ
  end

  def after_inactive_sign_up_path_for(resource)
    registration_complete_path # 登録が未アクティブな場合も同じ
  end

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :company_name, :division_name])
  end
end

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
#end
