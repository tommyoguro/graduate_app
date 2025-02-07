class CreateBuyerRequests < ActiveRecord::Migration[7.2]
  def change
    create_table :buyer_requests do |t|
      t.string :product_name
      t.integer :quantity
      t.string :delivery_address
      t.date :delivery_date

      t.timestamps
    end
  end
end
