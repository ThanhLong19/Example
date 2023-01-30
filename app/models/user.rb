# frozen_string_literal: true

class User < ApplicationRecord

  #=================Check validation of name(User) + email(User)=================
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }

  validates :email, presence: true, uniqueness: true, length: { maximum: 62 }, format: { with: VALID_EMAIL_REGEX }

  #=================Check validation of address(User) + birthday(User)=================

  validates :birthday, presence: true
  validates :address, presence: true

  #=================Check validation of password=================
  has_secure_password   #add Gemfile "bcrypt"

  validates :password, presence: true, length: { minimum: 6 }
end
