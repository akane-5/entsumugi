require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user)       # Userのインスタンスを作成
    @shrine = FactoryBot.create(:shrine)   # Shrineのインスタンスを作成
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
      it 'user_idがないとき' do
        @post.user_id = ''
        expect(@post).to be_invalid
        expect(@post.errors[:user_id]).to include("を入力してください")
      end

      it 'shrine_idがないとき' do
        @post.shrine_id = ''
        expect(@post).to be_invalid
        expect(@post.errors[:shrine_id]).to include("を入力してください")
      end

      it '画像が添付されていないとき' do
        @post.image.detach # 画像を添付しない状態にする
        expect(@post).to be_invalid
        expect(@post.errors[:image]).to include("を入力してください")
      end
    end
  end
end
