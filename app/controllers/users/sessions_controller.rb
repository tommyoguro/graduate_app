# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # skip_before_action :authenticate_user!, only: [:new]
  skip_before_action :require_no_authentication, only: [:new, :create]
  skip_before_action :verify_authenticity_token, only: [:create]

  #ログイン後のページ遷移 (`あとで書いといてください`) に遷移
  def after_sign_out_path_for(resource_or_scope)
    menu_path
  end

  #ログアウト後はログイン画面 (`users/sessions/new.html.erb`) に遷移
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
     user.password = SecureRandom.urlsafe_base64
     user.name = "ゲストユーザー"
     user.name_kana = "ゲストユーザー"
     user.company_name = "ゲスト会社"  # ← 追加
     user.division_name = "ゲスト部"    # ← 追加
  end 
    sign_in user
    redirect_to menu_path, notice: "ゲストユーザーとしてログインしました。"
  end

  def admin_guest_sign_in
   user = User.find_or_create_by!(email: "admin_guest@example.com") do |user|
    user.password = SecureRandom.urlsafe_base64
    user.name = "管理者ゲスト"
    user.name_kana = "カンリシャゲスト" # ← NULL にならないように追加
    user.company_name = "ゲスト会社" # 必要なら追加
    user.division_name = "ゲスト部門" # 必要なら追加
    user.is_admin = true
   end

   sign_in user
   redirect_to menu_index_path, notice: "管理者ゲストとしてログインしました。"
  end

  

  
  #def admin_guest_sign_in
    #admin_user = User.admin_guest_find_or_create
    #sign_in user
    #redirect_to menu_path, notice: "ゲスト管理者としてログインしました。"
  #end

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
