class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show , :new, :crete, :edit, :update, :destroy]
  before_action :get_user, only: [:edit, :update, :destroy]
  before_action :require_user_admin, only: [:admin_new, :admin_create, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def admin_new
    @user = User.new
  end

  def admin_create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: t(".create_success_notice")
    else
      render :admin_new, alert: t(".create_fail_alert")
    end
  end

  def edit
  end

  def show
    @user = current_user.admin? ? get_user : current_user
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: t(".update_success_notice")
    else
      render :edit, alert: t(".update_fail_notice")
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: t(".delete_success_notice")
    else
      redirect_to users_path, alert: t(".delete_success_alert")
    end
  end

  def connection
    @user = User.new(email: params[:email])
    if @user.save
      redirect_to users_path, notice: t(".create_success_notice")
    else
      binding.pry
      render :connection, alert: t(".create_fail_alert")
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :birthday, :address, :password, :password_confirmation, :role, :provider)
  end

  def get_user
    @user = User.find_by(id: params[:id])
    redirect_to root_path, notice: "Users not found" unless @user
    @user
  end
end
