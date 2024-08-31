class RemoveImageFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :image, :string
  end
end
