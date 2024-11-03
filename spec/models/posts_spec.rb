require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @shrine = FactoryBot.create(:shrine)
    @post = FactoryBot.build(:post, user: @user, shrine: @shrine) # userとshrineを指定
  end

  describe '新規投稿(バリデーションテスト)' do
    context '投稿ができる' do
      it 'すべての値が正しく入力されている' do
        expect(@post).to be_valid
      end

      it 'bodyだけが空欄のとき' do
        @post.body = ''
        expect(@post).to be_valid
      end
    end

    context '投稿ができない' do
      it 'user_idがnilのとき' do
        @post.user_id = nil
        expect(@post).to be_invalid
        expect(@post.errors[:user]).to include("を入力してください")
      end

      it 'shrine_idがnilのとき' do
        @post.shrine_id = nil
        expect(@post).to be_invalid
        expect(@post.errors[:shrine]).to include("を入力してください")
      end

      it '画像が添付されていないとき' do
        @post.image.detach # 画像を添付しない状態にする
        expect(@post).to be_invalid
        expect(@post.errors[:image]).to include("を入力してください")
      end

      it 'bodyが50文字を超えている' do
        @post.body = 'a' * 51
        expect(@post).to be_invalid
        expect(@post.errors[:body]).to include("は50文字以内で入力してください")
      end
    end
  end

  describe 'アソシエーションのテスト' do
    it 'ユーザーに属していること（belongs_to :user）' do
      expect(@post.user).to eq(@user)
    end

    it '神社に属していること（belongs_to :shrine）' do
      expect(@post.shrine).to eq(@shrine)
    end
  end
end
