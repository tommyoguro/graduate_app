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
    @seller_offer = SellerOffer.new(seller_offer_params)
    if @seller_offer.save
      redirect_to seller_offers_path, notice: "見積回答を送信しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_buyer_request
    @buyer_request = BuyerRequest.find(params[:buyer_request_id])
  end

  def seller_offer_params
    params.require(:seller_offer).permit(:buyer_request_id, :price, :delivery_date)
  end
end
