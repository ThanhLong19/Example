# frozen_string_literal: true

class User < ApplicationRecord
  #=================Check validation of name(User) + email(User)=================
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }

  validates :email, presence: true, uniqueness: true, length: { maximum: 62 }, format: { with: VALID_EMAIL_REGEX }

  #=================Check validation of password=================
  has_secure_password   # add Gemfile "bcrypt"

  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Sets the password reset attributes.
  def create_reset_digests
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
end
