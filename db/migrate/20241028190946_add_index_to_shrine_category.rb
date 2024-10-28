class AddIndexToShrineCategory < ActiveRecord::Migration[7.0]
  def change
    add_index :shrine_categories, [:shrine_id, :category_id], unique: true
  end
end
