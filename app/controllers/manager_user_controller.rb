class ManagerUserController < ApplicationController
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
      redirect_to manager_path, notice: "Create User successfully!!!"
    else
      redirect_to manager_new_path, alert: @user.errors.full_messages
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to manager_path, notice: "Update Users successfully!!!"
    else
      redirect_to manager_edit_path, alert: @user.errors.full_messages
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      redirect_to manager_path, notice: "Delete User Successfully"
    else
      redirect_to manager_path, alert: "Delete User Failed"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :birthday, :address, :password, :password_confirmation)
  end
end
