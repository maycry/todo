require 'spec_helper'

describe "Projects" do
  it "displays project" do
    project = create(:project)
    visit projects_path
    expect(page).to have_content(project.name)
  end

  it "create project", js: true do
    visit projects_path
    create_project
    expect(page).to have_content("Alpha Project")
  end

  it "edit project", js: true do
    project = create(:project)
    visit projects_path
    click_link "Edit"
    fill_in "project_name", with: "Another project"
    click_button "Update Project"
    expect(page).to have_content("Another project") 
  end

  it "delete project", js: true do
    project = create(:project)
    visit projects_path
    #save_and_open_page
    click_link "Remove"
    expect(page).not_to have_content(project.name)
  end

end

describe "Tasks" do
  it "displays task" do
    project = create(:project)
    task = create(:task)
    visit projects_path
    expect(page).to have_content(task.name)
  end

  it "create task", js: true do
    visit projects_path
    create_project
    expect(page).to have_content("Alpha Project")
    create_task
    expect(page).to have_content("Alpha Task")
  end

  it "edit task" do
    project = create(:project)
    task = create(:task)
    visit projects_path
    click_link "Edit Task"
    fill_in "task_name", with: "Task changed"
    click_button "Update Task"
    expect(page).to have_content("Task changed") 
  end

  it "delete task", js: true do
    visit projects_path
    create_project
    create_task
    click_link "x"
    expect(page).not_to have_content("Alpha Task")
  end
end

def create_project
  click_link "Add Project"
  fill_in "project_name", with: "Alpha Project"
  click_button "Create Project"
end

def create_task
  find(:css, ".project-item[data-id='1'] #task_name").set("Alpha Task")
  click_button "Create Task", match: :prefer_exact
end
