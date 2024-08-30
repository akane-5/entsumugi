class CreateShrineCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :shrine_categories do |t|
      t.references :shrine, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
