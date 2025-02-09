# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  protected 

   #ログアウト後はログイン画面 (`users/sessions/new.html.erb`) に遷移
   def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
 
   def guest_sign_in
     user = User.find_or_create_by!(email: 'guest@example.com') do |user|
       user.password = SecureRandom.urlsafe_base64
       user.name = "ゲストユーザー"
     end
    sign_in user
    redirect_to menu_path, notice: "ゲストユーザーとしてログインしました。"
   end

  def admin_guest_sign_in
    user = User.find_or_create_by!(email: 'admin_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト管理者"
      user.is_admin = true # is_adminに変更
    end
    sign_in user
    redirect_to admin_users_path, notice: "ゲスト管理者としてログインしました。"    
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

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
