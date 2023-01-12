# frozen_string_literal: true

module SessionsHelper
  # Log in user and save to session
  def log_in(user)
    session[:user_id] = user.id
  end

  # Get current user == /user/id
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Check user logged
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    reset_session
    @current_user = nil
  end

  # Returns true if the given user is the current user.
  def current_user?(user)
    user && user == current_user
  end
end
