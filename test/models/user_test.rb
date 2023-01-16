# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  #setup 1 Users main to check
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "password", password_confirmation: "password")
  end

  #==================Check Users be valid==================
  test "should be valid" do
    assert @user.valid?
  end

  #==================Check name(Users) + email(Users) empty/blank==================
  test "name should not empty" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should not empty" do
    @user.email = ""
    assert_not @user.valid?
  end

  #==================Check email(Users) duplication==================
  test "email cannot be duplication" do
    duplication_user = @user.dup
    @user.save
    assert_not duplication_user.valid?
  end

  #==================Check name(Users) + email(Users) length==================
  test "name should not be length too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be length too long" do
    @user.email = "a" * 51 + "@example.com"
    assert_not @user.valid?
  end

  #==================Check email(Users) format==================
  test "email should reject invalid format" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  #==================Check password+confirm_password length==================
  test "password cannot be length to short" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "password should be empty" do
    @user.password = @user.password_confirmation = ""
    assert_not @user.valid?
  end
end
