class SellerOffersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_buyer_request, only: [:new]

  def index
    @buyer_requests = BuyerRequest.all
  end

  def new
    @seller_offer = SellerOffer.new
  end

  def create
    @buyer_request = BuyerRequest.find(params[:buyer_request_id])
    @seller_offer = @buyer_request.seller_offers.build(seller_offer_params)
  
    if @seller_offer.save
      # 成功した場合は見積回答番号を表示する画面にリダイレクト
      redirect_to seller_offer_complete_path(@seller_offer), notice: '見積回答が送信されました。'
    else
      # 失敗した場合は再度入力画面を表示
      render :new, status: :unprocessable_entity
    end
  end

  def complete
    @seller_offer = SellerOffer.find(params[:id])
  end

  private

  def set_buyer_request
    @buyer_request = BuyerRequest.find(params[:buyer_request_id])
  end

  def seller_offer_params
    params.require(:seller_offer).permit(:buyer_request_id, :price, :delivery_date)
  end
end
