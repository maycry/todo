class Project < ActiveRecord::Base
  validates :name, presence: true
  has_many :tasks, dependent: :destroy
  belongs_to :user
  default_scope{ order('created_at DESC') }
end
