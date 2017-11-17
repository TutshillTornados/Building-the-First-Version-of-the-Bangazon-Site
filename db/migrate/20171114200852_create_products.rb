class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :customer, foreign_key: true
      t.references :product_type, foreign_key: true
      t.references :image, foreign_key: true
      t.string :product_name
      t.float :product_price
      t.text :product_desc
      t.integer :quantity
      t.datetime :product_added
      t.boolean :local_delivery
      
      t.timestamps
    end
  end
end
