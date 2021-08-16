class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      
      t.integer :client_id
      t.string :name
      t.string :postal_code
      t.string :adress

      t.timestamps
    end
  end
end
