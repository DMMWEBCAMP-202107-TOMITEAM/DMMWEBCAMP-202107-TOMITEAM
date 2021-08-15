class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      
      t.integer :item_id
      t.integer :order_id
      t.integer :item_count
      t.integer :item_price
      t.integer :production_status, default: 0

      t.timestamps
    end
  end
end
