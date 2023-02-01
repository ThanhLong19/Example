# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: t(".login_success_notice")
    else
      redirect_to new_session_path, alert: t(".login_success_alert")
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: t(".logout_success_notice")
  end
end
