require 'spec_helper'

describe "Projects" do
  it "displays project" do
    Project.create!(name: "Just project")
    visit projects_path
    expect(page).to have_content("Just project")
  end

  it "create project", js: true do
    visit projects_path
    create_project
    expect(page).to have_content("Alpha Project")
  end

  it "edit project", js: true do
    Project.create!(name: "Just project")
    visit projects_path
    click_link "Edit"
    fill_in "project_name", with: "Another project"
    click_button "Update Project"
    expect(page).to have_content("Another project") 
  end

  it "delete project", js: true do
    Project.create!(name: "Just project")
    visit projects_path
    click_link "Remove"
    expect(page).not_to have_content("Just project")
  end

end

describe "Tasks" do
  it "displays task" do
    Project.create!(name: "Just project")
    Task.create!(name: "paint fence", project_id: 1)
    visit projects_path
    expect(page).to have_content("paint fence")
  end

  it "create task", js: true do
    visit projects_path
    create_project
    expect(page).to have_content("Alpha Project")
    create_task
    expect(page).to have_content("Alpha Task")
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
