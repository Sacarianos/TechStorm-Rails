class ProjectsController < ApplicationController
  respond_to :html
  before_action :set_project, only: [:show, :edit, :update, :destroy, :join]
  before_action :set_creator, only: [:show, :edit, :update]
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @projects = Project.find_by_sql "SELECT *
    FROM projects;"

    respond_with(@projects)
  end

  def show
    @tasks = Task.find_by_sql "SELECT *
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
    @project= Project.delete_all("id="+params[:id].to_s)
redirect_to action: 'index'
end

  def delete
    @project= Project.delete_all("id="+params[:id].to_s)
    redirect_to "/index"
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
      params.require(:project).permit(:creator_id, :name, :description, tasks_attributes: [:id, :name, :_destroy])
    end
end
