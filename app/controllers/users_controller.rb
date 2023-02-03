class UsersController < ApplicationController
  before_action :require_user_logged_in
  before_action :get_user, only: [:edit, :update, :destroy]
  before_action :require_user_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @listuser = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: t(".create_success_notice")
    else
      redirect_to new_user_path, alert: t(".create_fail_alert")
    end
  end

  def edit
  end

  def show
    @user = User.find_by(id: session[:user_id])
    if @user.admin?
      get_user
    elsif !@user.admin? && User.find_by(id: session[:user_id]) == User.find_by(id: params[:id])
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to root_path, notice: t(".not_access_notice")
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: t(".update_success_notice")
    else
      redirect_to edit_user_path, alert: t(".update_fail_notice")
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
    params.require(:user).permit(:name, :email, :birthday, :address, :password, :password_confirmation, :role)
  end

  def get_user
    @user = User.find_by(id: params[:id])
    if @user == nil
      redirect_to root_path, notice: t(".not_found_users_notice")
    end
  end
end
