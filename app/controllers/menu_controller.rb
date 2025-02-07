class MenuController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def after_sign_in_path_for(resource)
    menu_path # 🔹 ログイン後にメニュー画面へ遷移
  end
end
