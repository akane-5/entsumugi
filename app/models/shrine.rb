class Shrine < ApplicationRecord
  belongs_to :prefecture
  has_many :posts
  has_many :shrine_categories
  has_many :categories, through: :shrine_categories

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

  # photo_referenceからURLを取得するメソッド
  def formatted_photo_reference
    # JSON形式からURLを取り出す
    urls = JSON.parse(photo_reference)
    # 最初のURLを取り出してエスケープ解除
    image_url = urls.first.gsub('\u0026', '&') if urls.any?
    image_url
  end
end
