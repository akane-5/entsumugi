require 'rails_helper'

RSpec.describe Shrine, type: :model do
  before do
    @prefecture = FactoryBot.create(:prefecture)
    @shrine = FactoryBot.build(:shrine, prefecture: @prefecture)
  end

  describe '神社登録(バリデーションテスト)' do
    context '神社が登録できる' do
      it 'すべての値が正しく入力されている' do
        expect(@shrine).to be_valid
      end
    end

    context '神社が登録できない' do
      it 'nameが空のとき' do
        @shrine.name = ''
        expect(@shrine).to be_invalid
        expect(@shrine.errors[:name]).to include("を入力してください")
      end

      it 'addressが空のとき' do
        @shrine.address = ''
        expect(@shrine).to be_invalid
        expect(@shrine.errors[:address]).to include("を入力してください")
      end

      it 'latitudeが空のとき' do
        @shrine.latitude = ''
        expect(@shrine).to be_invalid
        expect(@shrine.errors[:latitude]).to include("を入力してください")
      end

      it 'longitudeが空のとき' do
        @shrine.longitude = ''
        expect(@shrine).to be_invalid
        expect(@shrine.errors[:longitude]).to include("を入力してください")
      end

      it 'place_idが空のとき' do
        @shrine.place_id = ''
        expect(@shrine).to be_invalid
        expect(@shrine.errors[:place_id]).to include("を入力してください")
      end

      it 'prefecture_idが空のとき' do
        @shrine.prefecture = nil
        expect(@shrine).to be_invalid
        expect(@shrine.errors[:prefecture]).to include("を入力してください")
      end

      it 'place_idが重複しているとき' do
        FactoryBot.create(:shrine, place_id: "duplicate_place_id", prefecture: @prefecture)
        duplicate_shrine = FactoryBot.build(:shrine, place_id: "duplicate_place_id", prefecture: @prefecture)
        expect(duplicate_shrine).to be_invalid
        expect(duplicate_shrine.errors[:place_id]).to include("はすでに存在します")
      end

      it 'photo_referenceが無効なURL形式のとき' do
        @shrine.photo_reference = 'invalid_url'
        expect(@shrine).to be_invalid
        expect(@shrine.errors[:photo_reference]).to include("は不正な値です")
      end

      it 'websiteが無効なURL形式のとき' do
        @shrine.website = 'invalid_url'
        expect(@shrine).to be_invalid
        expect(@shrine.errors[:website]).to include("は不正な値です")
      end
    end
  end

  describe 'アソシエーションのテスト' do
    it 'prefectureに属していること（belongs_to :prefecture）' do
      expect(@shrine.prefecture).to eq(@prefecture)
    end

    it '複数の投稿を持つことができる（has_many :posts）' do
      post1 = FactoryBot.create(:post, shrine: @shrine)
      post2 = FactoryBot.create(:post, shrine: @shrine)
      expect(@shrine.posts).to include(post1, post2)
    end

    it '複数のshrine_categoriesを持つことができる（has_many :shrine_categories）' do
      shrine_category1 = FactoryBot.create(:shrine_category, shrine: @shrine)
      shrine_category2 = FactoryBot.create(:shrine_category, shrine: @shrine)
      expect(@shrine.shrine_categories).to include(shrine_category1, shrine_category2)
    end

    it '複数のカテゴリーを持つことができる（has_many :categories, through: :shrine_categories）' do
      category1 = FactoryBot.create(:category)
      category2 = FactoryBot.create(:category)
      FactoryBot.create(:shrine_category, shrine: @shrine, category: category1)
      FactoryBot.create(:shrine_category, shrine: @shrine, category: category2)
      expect(@shrine.categories).to include(category1, category2)
    end

    it '複数のブックマークを持つことができる（has_many :bookmarks）' do
      bookmark1 = FactoryBot.create(:bookmark, shrine: @shrine)
      bookmark2 = FactoryBot.create(:bookmark, shrine: @shrine)
      expect(@shrine.bookmarks).to include(bookmark1, bookmark2)
    end

    it '複数のユーザーにブックマークされることができる（has_many :bookmarked_by_users, through: :bookmarks）' do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      FactoryBot.create(:bookmark, shrine: @shrine, user: user1)
      FactoryBot.create(:bookmark, shrine: @shrine, user: user2)
      expect(@shrine.bookmarked_by_users).to include(user1, user2)
    end
  end
end
