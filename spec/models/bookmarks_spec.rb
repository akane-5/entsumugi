require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @shrine = FactoryBot.create(:shrine)
    @bookmark = FactoryBot.create(:bookmark, user: @user, shrine: @shrine)
  end

  describe 'ブックマーク(バリデーションテスト)' do
    context 'ブックマークができる' do
      it '有効なブックマークが作成できる' do
        expect(@bookmark).to be_valid
      end
    end

    context 'ブックマークができない' do
      it '同じユーザーが同じ神社をブックマークしたとき' do
        duplicate_bookmark = FactoryBot.build(:bookmark, user: @user, shrine: @shrine)
        expect(duplicate_bookmark).to be_invalid
        expect(duplicate_bookmark.errors[:user_id]).to include("はすでに存在します")
      end

      it 'ユーザーがnilのとき' do
        @bookmark.user = nil
        expect(@bookmark).to be_invalid
        expect(@bookmark.errors[:user]).to include("を入力してください")
      end

      it '神社がnilのとき' do
        @bookmark.shrine = nil
        expect(@bookmark).to be_invalid
        expect(@bookmark.errors[:shrine]).to include("を入力してください")
      end
    end
  end

  describe 'アソシエーションのテスト' do
    it 'ユーザーに属している' do
      expect(@bookmark.user).to eq(@user)
    end

    it '神社に属している' do
      expect(@bookmark.shrine).to eq(@shrine)
    end
  end
end
