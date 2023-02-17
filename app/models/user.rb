class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }

  validates :email, length: { maximum: 62 }, format: { with: VALID_EMAIL_REGEX }

  validates :birthday, presence: true
  validates :address, presence: true

  validates :password, length: { minimum: 6 }

  enum :role, { user_normal: 0, admin: 1 }

  def self.from_omniauth(auth)
    where(provider: auth.provider).first_or_create do |user|
      user.email = auth.info.email
    end
  end
end
