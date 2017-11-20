class ChangeAccountNumber < ActiveRecord::Migration[5.1]
  def change
    change_column :pay_methods, :account_number, :string
  end
end
