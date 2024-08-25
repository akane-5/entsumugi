class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
  validates :uid, presence: true, uniqueness: { scope: :provider }, if: -> { uid.present? }

  # omniauth_callbacks_controllerで使用
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  # uidにランダムな文字列を入れてdevise認証時にuidがnilになることを防ぐ(ユニーク制約のエラー対策/registrations_controllerの中で使用)
  def self.create_unique_string
    SecureRandom.uuid
  end
end
