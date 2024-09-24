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
end
