FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}"}
  end

  factory :task do
    sequence(:name) { |n| "Task #{n}"}
    project_id 1
  end
end