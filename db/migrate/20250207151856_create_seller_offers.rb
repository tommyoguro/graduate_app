class CreateSellerOffers < ActiveRecord::Migration[7.2]
  def change
    create_table :seller_offers do |t|
      t.references :buyer_request, null: false, foreign_key: true
      t.integer :price
      t.date :delivery_date

      t.timestamps
    end
  end
end
