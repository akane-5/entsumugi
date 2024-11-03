require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @category = FactoryBot.create(:category)
  end

  describe 'アソシエーションのテスト' do
    it '複数のshrine_categoriesを持つことができる(has_many :shrine_categories)' do
      shrine_category1 = FactoryBot.create(:shrine_category, category: @category)
      shrine_category2 = FactoryBot.create(:shrine_category, category: @category)
      expect(@category.shrine_categories).to include(shrine_category1, shrine_category2)
    end

    it '複数の神社を持つことができる(has_many :shrines, through: :shrine_categories)' do
      shrine1 = FactoryBot.create(:shrine)
      shrine2 = FactoryBot.create(:shrine)
      FactoryBot.create(:shrine_category, category: @category, shrine: shrine1)
      FactoryBot.create(:shrine_category, category: @category, shrine: shrine2)
      expect(@category.shrines).to include(shrine1, shrine2)
    end
  end
end
