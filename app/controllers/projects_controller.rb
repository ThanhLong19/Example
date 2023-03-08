class ProjectsController < ApplicationController

  before_action :require_user_logged_in
  before_action :require_user_admin, only: [:new, :create, :edit, :update, :destroy] 
  before_action :set_project, only: [:edit, :update, :destroy, :show]

  def index
    @projects = Project.all.page(params[:page]).per(set_per_page)
  end

	def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: t(".create_success_notice")
    else
      render :new
    end
  end

  def edit
    @project_members = Project.where(id: @project.id).first.project_members
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path, notice: t(".update_success_notice")
    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_path, notice: t(".delete_success_notice")
    else
      redirect_to projects_path, alert: t(".delete_success_alert")
    end 
  end

  private

	  def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :estimate_time, :owner, member_ids: [])
    end

    def set_per_page
      per_page = 5
    end
end
