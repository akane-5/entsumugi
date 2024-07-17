class AddaddressToshrines < ActiveRecord::Migration[7.0]
  def change
    add_column :shrines, :address, :string, null: false
    add_column :shrines, :latitude, :float, null: false
    add_column :shrines, :longitude, :float, null: false
    add_column :shrines, :place_id, :string, null: false, unique: true
    add_column :shrines, :photo_url, :string

    add_index :shrines, :place_id, unique: true
  end
end
