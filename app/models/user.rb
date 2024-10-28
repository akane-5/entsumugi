class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  has_many :posts, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_shrines, through: :bookmarks, source: :shrine

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, on: :create # 新規登録時
  validates :password, length: { minimum: 6 }, allow_nil: true, on: :update # パスワード更新時に入力された場合のみ
  validates :uid, presence: true, uniqueness: { scope: :provider }, if: -> { uid.present? }

  # omniauth_callbacks_controllerで使用
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  # uidにランダムな文字列を入れてdevise認証時にuidがnilになることを防ぐ(ユニーク制約のエラー対策/registrations_controllerの中で使用)
  def self.create_unique_string
    SecureRandom.uuid
  end

  # ユーザーの投稿を神社情報、カテゴリ情報を含めて降順で取得
  def my_posts_list
    posts.includes(shrine: :categories).order(created_at: :desc)
  end

  # ユーザーがブックマークした神社を取得
  def bookmarked_shrines_list
    bookmarks.includes(shrine: :categories)
  end
end
