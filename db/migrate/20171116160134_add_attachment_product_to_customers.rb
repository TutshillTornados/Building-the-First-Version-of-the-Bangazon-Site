class AddAttachmentProductToCustomers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :customers do |t|
      t.attachment :product
    end
  end

  def self.down
    remove_attachment :customers, :product
  end
end
