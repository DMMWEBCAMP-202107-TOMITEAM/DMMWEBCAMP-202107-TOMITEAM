class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      
      t.integer :genre_id
      t.string :item_name
      t.integer :tax_out_price
      t.string :image_id
      t.text :explanation
      t.integer :sale_status, default: 0

      t.timestamps
    end
  end
end
