class Shrine < ApplicationRecord
  belongs_to :prefecture

  validates :name, presence: true
  validates :address, presence: true
  validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :place_id, presence: true, uniqueness: true
  validates :photo_url, allow_blank: true

  def self.ransackable_attributes(auth_object = nil)
    ["prefecture_id","name",]
  end
end
