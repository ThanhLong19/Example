class UsersController < ApplicationController
  before_action :require_user_logged_in
  before_action :get_user, only: [:edit, :update, :destroy]

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path, notice: t(".create_success_notice")
    else
      redirect_to new_user_path, alert: @user.errors.full_messages
    end
  end

  def edit
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: t(".update_success_notice")
    else
      redirect_to edit_user_path, alert: @user.errors.full_messages
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: t(".delete_success_notice")
    else
      redirect_to users_path, alert: t(".delete_success_alert")
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :birthday, :address, :password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(id: params[:id])
    if @user == nil
      redirect_to root_path, notice: "Users not found"
    end
  end
end
