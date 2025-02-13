class BuyerRequest < ApplicationRecord
    validates :product_name, presence: true, length: { maximum: 255 }
    validates :quantity, presence: true, numericality: { greater_than: 0 }
    validates :delivery_address, presence: true
    validates :delivery_date, presence: true

    has_many :seller_offers, dependent: :destroy
end
