class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable, :recoverable
  has_many :users
  

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }

  validates :email, length: { maximum: 62 }, format: { with: VALID_EMAIL_REGEX }

  validates :birthday, presence: true
  validates :address, presence: true

  validates :password, length: { minimum: 6 }

  enum :role, { user_normal: 0, admin: 1 }
end
