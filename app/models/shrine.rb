class Shrine < ApplicationRecord
  belongs_to :prefecture

  validates :name, presence: true
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :place_id, presence: true, uniqueness: true
  validates :photo_reference, presence: true, allow_blank: true
  validates :website, presence: true, allow_blank: true

  def self.ransackable_attributes(auth_object = nil)
    ["prefecture_id","name",]
  end
end
