class BuyerRequest < ApplicationRecord
    validates :product_name, :quantity, :delivery_address, :delivery_date, presence: true
    has_many :seller_offers, dependent: :destroy
end
