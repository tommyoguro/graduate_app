# app/controllers/admin/base_controller.rb
class Admin::BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin
  
    private
  
    def authenticate_admin!
      unless current_user&.is_admin?
        flash[:alert] = "管理者のみアクセス可能です。"
        redirect_to root_path
      end
    end
  end
  