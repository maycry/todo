class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    respond_to :js
  end

  def create
    @project = Project.new(project_params)
    if @project.save 
      respond_to :js 
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      respond_to :js 
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      respond_to :js
    end
  end

  private

    def project_params
      params.require(:project).permit(:name)
    end
end
