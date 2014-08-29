class Task < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :project
  acts_as_list scope: :project
  after_create :set_position

  def toggle_complete
    if status == "incomplete"
      update status: "complete"
    else
      update status: "incomplete"
      self.move_to_bottom
    end
  end

  def set_position
    self.move_to_top
  end
end
