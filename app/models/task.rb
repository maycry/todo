class Task < ActiveRecord::Base
  belongs_to :project
  acts_as_list scope: :project
  after_create :set_position

  default_scope { order('position ASC') }

  def toggle_complete
    if status == "incomplete"
      update status: "complete"
    else
      update status: "incomplete"
    end
  end

  def set_position
    Task.last.move_to_top
  end
end
