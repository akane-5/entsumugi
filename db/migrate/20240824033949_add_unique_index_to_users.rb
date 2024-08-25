class AddUniqueIndexToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :provider, :string, default: 'devise', null: false
    change_column :users, :uid, :string, default: 'devise_user', null: false
    add_index :users, [:provider, :uid], unique: true
  end
end
