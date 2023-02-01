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
      redirect_to users_path, notice: "Create User successfully!!!"
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
      redirect_to users_path, notice: "Update Users successfully!!!"
    else
      redirect_to edit_user_path, alert: @user.errors.full_messages
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: "Delete User Successfully"
    else
      redirect_to users_path, alert: "Delete User Failed"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :birthday, :address, :password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(id: params[:id])
  end
end
