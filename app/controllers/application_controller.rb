# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def require_user_logged_in
    redirect_to new_user_session_path, notice: t(".require_user_logged_in_notice") if current_user.nil?
  end

  def require_user_admin
    redirect_to root_path, notice: t(".not_access_notice") unless current_user.admin?
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :birthday, :address, :password, :password_confirmation])         
    end
end
