class ChangeProviderAndUidInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :provider, true  # null: falseを削除
    change_column_null :users, :uid, true       # null: falseを削除
  end
end
