class AddActiveToProductsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :active, :boolean
  end
end
