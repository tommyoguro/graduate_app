class UsersController < ApplicationController
  before_action :authenticate_user!  # 未ログインユーザーをログインページへ
  before_action :require_admin       # 管理者以外アクセス不可

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました。"
      redirect_to admin_users_path
    else
      flash[:alert] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "ユーザーを削除しました。"
    redirect_to admin_users_path
  end

  def profile
    # マイページ
    @user = User.find(params[:id]) # ユーザー情報を取得
  end

  def show
    if params[:id] == "sign_out"
      redirect_to root_path, alert: "無効なリクエストです。" and return
    end
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to root_path, alert: "ユーザーが見つかりません。" and return
    end
  end
 

  private

  def require_admin
    unless current_user&.admin?
      flash[:alert] = "管理者権限が必要です。"
      redirect_to new_user_session_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :is_admin)
  end
end
