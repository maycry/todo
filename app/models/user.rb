class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :defaults

  has_many :projects, dependent: :destroy

  def defaults
    project = Project.create!(name: "My First List", user_id: id)
    Task.create!(name: "Click&drag dots to sort tasks", project_id: project.id)
    Task.create!(name: "Click on list name to edit it", project_id: project.id)
    Task.create!(name: "Click on task to edit it", project_id: project.id)
    Task.create!(name: "Click “Create new list” to add a list", project_id: project.id)
    Task.create!(name: "Click checkmark to complete task", project_id: project.id)
    Task.create!(name: "Put mouse cursor over task", project_id: project.id)
  end
end
