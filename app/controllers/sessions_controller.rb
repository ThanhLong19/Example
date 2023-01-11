class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      reset_session
      log_in user
      redirect_to root_path, notice: "Hello " + user.name
    else
      redirect_to signin_path, alert: "Signin errors. Invalid email/password"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
