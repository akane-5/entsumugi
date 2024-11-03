class Post < ApplicationRecord
  belongs_to :user
  belongs_to :shrine

  has_one_attached :image

  validates :image, presence: true
  validates :body, length: { maximum: 50 }

  # すべてのユーザーの投稿を、ユーザー情報、神社情報を含めて降順で取得
  def self.all_users_posts
    includes(:user, :shrine).order(created_at: :desc)
  end
end
