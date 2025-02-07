class SellerOffer < ApplicationRecord
  belongs_to :buyer_request

  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :delivery_date, presence: true
end
