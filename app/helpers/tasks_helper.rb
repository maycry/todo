module TasksHelper
  def task_status? status
    status == "incomplete"
  end
end
