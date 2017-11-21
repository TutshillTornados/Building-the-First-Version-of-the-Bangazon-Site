class RenameImagesTableToPhotos < ActiveRecord::Migration[5.1]
  def change
    rename_table :images, :photos
  end
end
