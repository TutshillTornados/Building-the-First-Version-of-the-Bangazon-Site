class CreatePayMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :pay_methods do |t|
      t.string :payment_type
      t.integer :account_number
      t.date :expiration_date
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
