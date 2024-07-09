class AddPrefectureIdToShrines < ActiveRecord::Migration[7.0]
  def change
    add_reference :shrines, :prefecture, foreign_key: true
  end
end
