class UsersController < ApplicationController
  before_action :require_user_logged_in,  only: [:index, :show , :new, :crete, :edit, :update, :destroy]
  before_action :get_user, only: [:edit, :update, :destroy]
  before_action :require_user_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = current_user.admin? ? get_user : current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: t(".create_success_notice")
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: t(".update_success_notice")
    else
      render :edit
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
  end

  def connect_google
    @user = User.new(user_params)
    if @user.save
      sign_in(:user, @user)
      redirect_to root_path, notice: t(".create_success_notice")
    else
      render :connection
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
