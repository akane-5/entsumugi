class Category < ApplicationRecord
  has_many :shrine_categories, dependent: :destroy
  has_many :shrines, through: :shrine_categories
end
