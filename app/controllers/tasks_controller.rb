class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    if @task.save
      respond_to :js
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      respond_to :js
    end
  end

  private

    def task_params
      params.require(:task).permit(:name, :project_id, :status)
    end
end
