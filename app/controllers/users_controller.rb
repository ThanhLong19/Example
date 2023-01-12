# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[edit update]
  before_action :correct_user, only: %i[edit update]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      # reset_session
      log_in @user
      redirect_to root_path, notice: 'Create Accout Successfully!!!'
    else
      redirect_to signup_path, alert: @user.errors.full_messages
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path, notice: 'Update Profile Successfully!!!'
    else
      redirect_to edit_user_path(current_user), alert: @user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # Confirms user login
  def logged_in_user
    return if logged_in?

    redirect_to signin_url, notice: 'Logged In when want to do what'
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
