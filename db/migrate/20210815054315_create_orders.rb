class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :client_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :shipping_cost
      t.integer :payment_method, default: 0
      t.integer :total_payment
      t.integer :order_status, default: 0

      t.timestamps
    end
  end
end
