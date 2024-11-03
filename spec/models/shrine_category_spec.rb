require 'rails_helper'

RSpec.describe ShrineCategory, type: :model do
  before do
    @category = FactoryBot.create(:category)
    @shrine = FactoryBot.create(:shrine)
    @shrine_category = FactoryBot.build(:shrine_category, category: @category, shrine: @shrine)
  end

  describe 'バリデーションのテスト' do
    context '有効なshrine_categoryを作成できる' do
      it '有効な場合' do
        expect(@shrine_category).to be_valid
      end
    end

    context '無効な場合' do
      it '同じ神社に同じカテゴリーが重複して関連付けられない' do
        FactoryBot.create(:shrine_category, category: @category, shrine: @shrine)
        duplicate_shrine_category = FactoryBot.build(:shrine_category, category: @category, shrine: @shrine)
        expect(duplicate_shrine_category).not_to be_valid
        expect(duplicate_shrine_category.errors[:shrine_id]).to include("はすでに存在します")
      end

      it 'shrineがnilの場合' do
        @shrine_category.shrine = nil
        expect(@shrine_category).not_to be_valid
        expect(@shrine_category.errors[:shrine]).to include("を入力してください")
      end

      it 'categoryがnilの場合' do
        @shrine_category.category = nil
        expect(@shrine_category).not_to be_valid
        expect(@shrine_category.errors[:category]).to include("を入力してください")
      end
    end
  end
end
