class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    @user = User.find_by(email: auth["info"]["email"])
    if @user  
      sign_in(:user, @user)
      flash[:notice] = t "devise.omniauth_callbacks.success", kind: "Google"
      redirect_to root_path
    else
      redirect_to connection_users_path(email: auth["info"]["email"])
    end
  end

  private

  def auth
    request.env["omniauth.auth"]
  end

end
