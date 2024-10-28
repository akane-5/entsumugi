class ShrineCategory < ApplicationRecord
  belongs_to :shrine
  belongs_to :category

  # 1つの神社に同じcategory_idが重複しないようにshrine_idとcategory_idの組み合わせをユニークにする
  validates :shrine_id, uniqueness: { scope: :category_id }
end
