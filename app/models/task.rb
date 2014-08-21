class Task < ActiveRecord::Base
  belongs_to :project

  default_scope { order('created_at DESC') }

  def toggle_complete
    if status == "incomplete"
      update status: "complete"
    else
      update status: "incomplete"
    end
  end
end
