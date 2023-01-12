# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  def require_user_logged_in!
    redirect_to signin_path, alert: "You must be signed in to do what" if current_user.nil?
  end
end
