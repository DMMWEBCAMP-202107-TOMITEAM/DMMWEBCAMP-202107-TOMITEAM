class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.integer :client_id
      t.string :shipping_postal_code
      t.string :shipping_address
      t.string :shipping_name
      t.string :payment_method, default: 0
      t.integer :postage
      t.integer :total_price
      t.integer :order_status, default: 0

      t.timestamps
    end
  end
end
