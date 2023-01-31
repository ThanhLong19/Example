class PasswordResetsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_now
      redirect_to root_path, notice: "Link reset password have sent your email"
    else
      redirect_to new_password_reset_path, alert: "Sent link reset password fail"
    end
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to new_session_path, alert: "Your token has expired. Please try again."
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to new_session_path, notice: "Your password was reset successfully!!!. Please sign in"
    else
      redirect_to password_reset_edit_path(token: params[:token]), alert: @user.errors.full_messages
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
