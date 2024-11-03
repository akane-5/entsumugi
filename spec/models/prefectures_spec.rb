require 'rails_helper'

RSpec.describe Prefecture, type: :model do
  before do
    @prefecture = FactoryBot.create(:prefecture)
  end

  describe 'アソシエーションのテスト' do
    it '複数の神社を持つことができる(has_many :shrines)' do
      shrine1 = FactoryBot.create(:shrine, prefecture: @prefecture)
      shrine2 = FactoryBot.create(:shrine, prefecture: @prefecture)
      expect(@prefecture.shrines).to include(shrine1, shrine2)
    end
  end
end
