class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!  # 未ログインユーザーはログイン画面へリダイレクト
  before_action :require_admin       # 管理者以外はアクセス不可

  def index
    @users = User.all.order(:id)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "ユーザー情報を更新しました。"
    else
      render :edit, alert: "更新に失敗しました。"
    end
  end

  def destroy
    if @user != current_user
      @user.destroy
      redirect_to admin_users_path, notice: "ユーザーを削除しました。"
    else
      redirect_to admin_users_path, alert: "自分自身を削除することはできません。"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :is_admin)
  end

  def require_admin
  　unless current_user.admin?
      flash[:alert] = "管理者権限が必要です。"
      redirect_to root_path # 管理者以外はトップページにリダイレクト
    end
  end

