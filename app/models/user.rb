class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  validates :name, presence: true, length: { maximum: 50 }

  validates :birthday, presence: true

  validates :address, presence: true

  enum :role, { user_normal: 0, admin: 1 }

end
