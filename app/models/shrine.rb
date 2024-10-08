class Shrine < ApplicationRecord
  belongs_to :prefecture
  has_many :posts, dependent: :destroy
  has_many :shrine_categories, dependent: :destroy
  has_many :categories, through: :shrine_categories
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_by_users, through: :bookmarks, source: :user

  validates :name, presence: true
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :place_id, presence: true, uniqueness: true
  validates :photo_reference, presence: true, allow_blank: true
  validates :website, presence: true, allow_blank: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[prefecture_id name]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[shrine_categories categories]
  end

  # photo_referenceからURLを取得するメソッド
  def formatted_photo_reference
    # JSON形式からURLを取り出す
    urls = JSON.parse(photo_reference)
    # 配列の最初のURLを返す
    urls.first
  end
end
