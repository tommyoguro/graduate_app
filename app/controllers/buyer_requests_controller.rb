class BuyerRequestsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @buyer_request = BuyerRequest.new
    @user = current_user # Devise を使っている場合
  end

  def create
    @buyer_request = BuyerRequest.new(buyer_request_params)
    if @buyer_request.save
      redirect_to confirm_buyer_request_path(@buyer_request)
    else
     puts @buyer_request.errors.full_messages # デバッグ用
     render :new, status: :unprocessable_entity # ← これを追加
    end
  end

  def confirm
    @buyer_request = BuyerRequest.find(params[:id])
  end

  private

  def buyer_request_params
    params.require(:buyer_request).permit(:product_name, :quantity, :delivery_address, :delivery_date)
  end
end
