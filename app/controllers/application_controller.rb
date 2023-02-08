# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # before_action :set_locale
  # helper_method :current_user

  # def require_user_logged_in
  #   redirect_to new_session_path, notice: t(".require_user_logged_in_notice") if current_user.nil?
  #   end

  # def set_locale
  #   I18n.locale = params[:locale] || I18n.default_locale
  # end

  # def default_url_options
  #   { locale: I18n.locale }
  # end

  # # def current_user
  # #   if session[:user_id]
  # #     User.find_by(id: session[:user_id])
  # #   end
  # # end

  # def require_user_admin
  #   redirect_to root_path, notice: t(".not_access_notice") unless current_user.admin?
  # end

end
