class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    if params[:id] =~ /\D/ # id に数値以外の文字が含まれている場合
      redirect_to dashboard_path, alert: "無効なユーザー ID です。" and return
    end 

    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to dashboard_path, alert: "ユーザーが見つかりません。"
  end
end

