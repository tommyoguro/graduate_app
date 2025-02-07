class DashboardController < ApplicationController
    before_action :authenticate_user! # ログイン必須
  
    def index
      @users = User.all # ユーザー一覧を取得
    end
  end
  
