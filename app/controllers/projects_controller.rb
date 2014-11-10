class ProjectsController < ApplicationController
  respond_to :html
  before_action :set_project, only: [:show, :edit, :update, :destroy, :join]
  before_action :set_creator, only: [:show, :edit, :update]
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @projects = Project.all
    respond_with(@projects)
  end

  def show
    @tasks = Task.find_by_sql "SELECT task_name, uid
    FROM tasks, works_on
    WHERE tasks.tid=works_on.tid
    AND tasks.pid="+params[:id].to_s
    respond_with(@project)
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def edit
    respond_with(@project)
  end

  def create
    @project = Project.new(project_params)
    flash[:notice] = 'Project was successfully created.' if @project.save
    respond_with(@project)
  end

  def update
    flash[:notice] = 'Project was successfully updated.' if @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end

  def join
     project = Project.find(params[:id])
     collaborate = Collaborate.new(proyect_id: project.id, user_id: current_user.id)
     current_user.collaborates << collaborate
    
end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def set_creator
      @creator = User.find(@project.creator_id)
    end

    def project_params
      params.require(:project).permit(:creator_id, :name, :description)
    end
end
