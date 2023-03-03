class MembersController < ApplicationController 

  before_action :require_user_logged_in
  before_action :get_member, only: [:show, :edit, :update, :destroy]
  before_action :require_user_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @members = Member.all
  end

  def show
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to members_path, notice: t(".create_success_notice")
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to members_path, notice: t(".update_success_notice")
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

    def member_params
      params.require(:member).permit(:name)
    end

    def get_member
      @member = Member.find_by(id: params[:id])
    end

end
