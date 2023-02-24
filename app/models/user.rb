class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }

  validates :email, presence: true, uniqueness: true, length: { maximum: 62 }, format: { with: VALID_EMAIL_REGEX }

  validates :birthday, presence: true
  validates :address, presence: true

  validates :password, presence: true, length: { minimum: 6 }

  enum :role, { user_normal: 0, admin: 1 }

end
