class AddWebsiteToShrines < ActiveRecord::Migration[7.0]
  def change
    add_column :shrines, :website, :string
  end
end
