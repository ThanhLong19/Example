# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Create account successfully!!!"
    else
      redirect_to signup_path, alert: @user.errors.full_messages
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    @user = User.find_by(id: session[:user_id])
    if @user.update(user_params)
      redirect_to root_path, notice: "Update Information Users successfully!!!"
    else
      redirect_to users_edit_path, alert: @user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
