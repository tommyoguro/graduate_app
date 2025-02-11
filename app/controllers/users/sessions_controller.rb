# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # skip_before_action :authenticate_user!, only: [:new]
  skip_before_action :require_no_authentication, only: [:new, :create]

  #ログイン後のページ遷移 (`あとで書いといてください`) に遷移
  def after_sign_out_path_for(resource_or_scope)
    menu_path
  end

  #ログアウト後はログイン画面 (`users/sessions/new.html.erb`) に遷移
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def guest_sign_in
    user = User.guest_find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    user.name = "ゲストユーザー"
    user.name_kana = "ゲストユーザー" #追加: NOT NULL制約を満たす
    end 
    sign_in user
    redirect_to menu_path, notice: "ゲストユーザーとしてログインしました。"
  end

  def admin_guest_sign_in
    admin_user = User.guest_admin_find_or_create
    sign_in admin_user
    redirect_to menu_path, notice: "ゲスト管理者としてログインしました。"
  end

  # GET /resource/sign_in
  #def new
     #super
  #end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
