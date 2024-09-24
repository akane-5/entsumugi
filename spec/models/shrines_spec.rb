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
    end
  end
end
