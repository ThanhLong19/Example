class ProjectController < ApplicationController

  before_action :require_user_logged_in, only: [:index]
  before_action :require_user_admin, only: [:index] 

  def index

  end

end
