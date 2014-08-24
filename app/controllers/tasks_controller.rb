class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    if @task.save
      respond_to :js
    end
  end

  def edit
    @task = Task.find(params[:id])
    respond_to :js
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      respond_to :js
    else
      render root_path
    end
  end

  def toggle_status
    @task = Task.find(params[:id])
    if @task.toggle_complete
      respond_to :js
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      respond_to :js
    end
  end

  def sort
    params[:task].each_with_index do |id, index|
      Task.find(id).update_attribute("position", index+1)
    end
    render nothing: true
  end

  private

    def task_params
      params.require(:task).permit(:name, :project_id, :status)
    end
end
