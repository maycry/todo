class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  default_scope{ order('created_at DESC') }
end
