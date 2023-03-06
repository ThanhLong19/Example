class ProjectsController < ApplicationController
  before_action :require_user_logged_in
  before_action :require_user_admin, only: [:new, :create, :edit, :update, :destroy] 
  before_action :get_project, only: [:edit, :update, :destroy, :show]

  def index
    @projects = Project.all
  end

	def show
    if @project.present?
      @project_members = Project.where(id: @project.id).first.project_members
    else
      redirect_to root_path, notice: t(".not_found_project")
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.member_ids = params[:member_ids]
    binding.pry
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

	  def get_project
      @project = Project.find_by(id: params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :estimate_time, :owner, project_members_attributes: [:product_id, :member_id])
    end
end
