class BuyerRequestsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @buyer_request = BuyerRequest.new
  end

  def create
    @buyer_request = BuyerRequest.new(buyer_request_params)
    if @buyer_request.save
      redirect_to confirm_buyer_request_path(@buyer_request)
    else
      render :new
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
