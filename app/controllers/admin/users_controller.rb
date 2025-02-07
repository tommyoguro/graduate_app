class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "ユーザー情報を更新しました"
    else
      render :edit
  end
end

private

  def require_admin
    redirect_to root_path, alert: "管理者のみアクセスできます" unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin)
  end
end
