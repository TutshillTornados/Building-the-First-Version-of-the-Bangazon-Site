class PayMethods < ActiveRecord::Migration[5.1]
  def change
    add_column :pay_methods, :active_record, :boolean    
  end
end
