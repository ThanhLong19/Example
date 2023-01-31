class UsersController < ApplicationController
  before_action :require_user_logged_in

  def show
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to show_path, notice: "Create User successfully!!!"
    else
      redirect_to new_user_path, alert: @user.errors.full_messages
    end
  end

  def edit
    get_user
  end

  def update
    get_user
    if @user.update(user_params)
      redirect_to show_path, notice: "Update Users successfully!!!"
    else
      redirect_to edit_user_path, alert: @user.errors.full_messages
    end
  end

  def destroy
    get_user
    if @user.destroy
      redirect_to show_path, notice: "Delete User Successfully"
    else
      redirect_to show_path, alert: "Delete User Failed"
    end
  end

  private

  def get_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :birthday, :address, :password, :password_confirmation)
  end
end
