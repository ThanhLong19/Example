# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    user = User.from_omniauth(auth)
    if user.present?
      if User.find_by(email: user.email) == nil
        redirect_to connection_users_path(email: user.email)
      else
        user = User.find_by(email: user.email)
        sign_in(:user, user)
        flash[:notice] = t "devise.omniauth_callbacks.success", kind: "Google"
        redirect_to root_path
      end
    else
      flash[:alert] = t "devise.omniauth_callbacks.failure", kind: "Google", reason: "#{auth.info.email} is not authorized"
      redirect_to new_user_session_path
    end
  end

  private

  def auth
    request.env["omniauth.auth"]
  end

  def require_login
      unless current_user
        redirect_to new_user_registration_path, notice: 'Please sign in to get started!'
      end
  end
end
