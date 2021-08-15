class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      
      t.integer :item_id
      t.string :shipping_address
      t.string :shipping_name
      t.string :shipping_postal_code

      t.timestamps
    end
  end
end
