class Post < ApplicationRecord
  belongs_to :user
  belongs_to :shrine

  has_one_attached :image

  validates :user_id, presence: true
  validates :shrine_id, presence: true
  validates :image, presence: true
end
