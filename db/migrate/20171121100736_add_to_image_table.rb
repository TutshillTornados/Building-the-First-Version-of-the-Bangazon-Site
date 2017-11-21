class AddToImageTable < ActiveRecord::Migration[5.1]
  def change
    add_reference :images, :imageable, polymorphic: true, index: true, optional: true   
  end
end
