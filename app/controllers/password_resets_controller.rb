class PasswordResetsController < ApplicationController
  before_action :require_user_logged_in!, only: [:edit, :update]
  before_action :get_user, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      redirect_to root_url, notice: "Email sent with password reset instructions"
    else
      redirect_to forget_password_path, alert: "Email address not found"
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "Password has been reset."
    else
      redirect_to root_path, notice: "Reset Password Fail"
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end
end
