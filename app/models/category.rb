class Category < ApplicationRecord
  has_many :shrine_categories
  has_many :shrines, through: :shrine_categories
end
