class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :shrine

  validates :user_id, uniqueness: { scope: :shrine_id } # ユーザーが同じ神社を複数回ブックマークできないようにする
end
