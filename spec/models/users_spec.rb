require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できるとき' do
      it 'すべての値が正しく入力されている場合' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できないとき(空欄)' do
      it 'ユーザー名が空欄' do
        @user.name = ''
        expect(@user).to be_invalid
        expect(@user.errors[:name]).to include("を入力してください")
      end

      it 'メールアドレスが空欄' do
        @user.email = ''
        expect(@user).to be_invalid
        expect(@user.errors[:email]).to include("を入力してください")
      end

      it 'パスワードが空欄' do
        @user.password = ''
        expect(@user).to be_invalid
        expect(@user.errors[:password]).to include("を入力してください")
      end

      it 'パスワード(確認用)が空欄' do
        @user.password_confirmation = ''
        expect(@user).to be_invalid
        expect(@user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
    end

    context 'ユーザー登録できないとき(その他)' do
      it 'ユーザー名がすでに存在している' do
        user1 = FactoryBot.create(:user, name: @user.name)
        expect(@user).to be_invalid
        expect(@user.errors[:name]).to include("はすでに存在します")
      end

      it 'メールアドレスがすでに存在している' do
        user1 = FactoryBot.create(:user, email: @user.email)
        expect(@user).to be_invalid
        expect(@user.errors[:email]).to include("はすでに存在します")
      end

      it 'メールアドレスに@が含まれていない' do
        @user.email = 'invalidemail'
        expect(@user).to be_invalid
        expect(@user.errors[:email]).to include("は不正な値です")
      end

      it 'パスワードとパスワード(確認用)が一致しない' do
        @user.password_confirmation = 'differentpassword'
        expect(@user).to be_invalid
        expect(@user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
    end
  end

  describe 'アソシエーションのテスト' do
    it '1人のユーザーが複数の投稿を持つことができる(has_many :posts)' do
      post1 = FactoryBot.create(:post, user: @user)
      post2 = FactoryBot.create(:post, user: @user)
      expect(@user.posts).to include(post1, post2)
    end

    it 'ユーザーが削除されると関連する投稿も削除される(dependent: :destroy)' do
      post = FactoryBot.create(:post, user: @user)
      expect { @user.destroy }.to change { Post.count }.by(-1)
    end

    it '1人のユーザーが複数のブックマークを持つことができる(has_many :bookmarks)' do
      bookmark1 = FactoryBot.create(:bookmark, user: @user)
      bookmark2 = FactoryBot.create(:bookmark, user: @user)
      expect(@user.bookmarks).to include(bookmark1, bookmark2)
    end

    it 'ブックマークを通じて複数の神社情報を持てる(has_many :bookmarked_shrines, through: :bookmarks, source: :shrine)' do
      shrine1 = FactoryBot.create(:shrine)
      shrine2 = FactoryBot.create(:shrine)
      bookmark1 = FactoryBot.create(:bookmark, user: @user, shrine: shrine1)
      bookmark2 = FactoryBot.create(:bookmark, user: @user, shrine: shrine2)
      expect(@user.bookmarked_shrines).to include(shrine1, shrine2)
    end

    it 'ユーザーが削除されると関連するブックマークも削除される(dependent: :destroy)' do
      bookmark = FactoryBot.create(:bookmark, user: @user)
      expect { @user.destroy }.to change { Bookmark.count }.by(-1)
    end
  end
end
