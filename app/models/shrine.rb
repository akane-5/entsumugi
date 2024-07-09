class Shrine < ApplicationRecord
  belongs_to :prefecture

  def self.ransackable_attributes(auth_object = nil)
    ["prefecture_id","name",]
  end
end
