class RenamePhotoUrlToPhotoReference < ActiveRecord::Migration[7.0]
  def change
    rename_column :shrines, :photo_url, :photo_reference
  end
end
