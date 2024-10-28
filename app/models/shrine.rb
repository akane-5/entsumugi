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
  validates :photo_reference, allow_blank: true
  validates :website, allow_blank: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[prefecture_id name]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[shrine_categories categories]
  end

  # 新規投稿フォームに入力された神社名を元に、神社情報とカテゴリ情報を探す(postsコントローラーで呼び出されるメソッド)
  def self.find_shrine_for_post(name)
    shrine = find_by(name: name)
    if shrine
      categories = shrine.categories.pluck(:name) # カテゴリ名を配列で取得
      { id: shrine.id, address: shrine.address, categories: categories }
    else
      {}
    end
  end

  # photo_referenceからURLを取得するメソッド
  def formatted_photo_reference
    # JSON形式からURLを取り出す
    urls = JSON.parse(photo_reference)
    # 配列の最初のURLを返す
    urls.first
  end
end
