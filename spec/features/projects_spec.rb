require 'spec_helper'

describe "Projects" do
  it "displays project" do
    project = create(:project)
    visit projects_path
    expect(page).to have_selector(".create-project-form input[value='#{project.name}']")
  end

#   it "create project", js: true do
#     visit projects_path
#     create_project
#     visit projects_path
#     expect(page).to have_content("Alpha Project")
#   end

#   it "edit project", js: true do
#     project = create(:project)
#     visit projects_path
#     click_link "Edit"
#     fill_in "project_name", with: "Another project"
#     click_button "Update Project"
#     visit projects_path
#     expect(page).to have_content("Another project") 
#   end

  it "delete project", js: true do
    project = create(:project)
    visit projects_path
    save_and_open_page
    click_link "Delete"
    expect(page).not_to have_selector(".project-item")
  end

# end

# describe "Tasks" do
#   it "displays task" do
#     project = create(:project)
#     task = create(:task)
#     visit projects_path
#     expect(page).to have_content(task.name)
#   end

#   it "create task", js: true do
#     visit projects_path
#     create_project
#     expect(page).to have_content("Alpha Project")
#     create_task
#     visit projects_path
#     expect(page).to have_content("Alpha Task")
#   end

#   it "edit task", js: true do
#     project = create(:project)
#     task = create(:task)
#     visit projects_path
#     click_link "Edit T"
#     within(".edit_task") do
#       fill_in "task_name", with: "Edited task"
#       click_button "Update Task"
#     end
#     visit projects_path
#     expect(page).to have_content("Edited task")
#   end

#   it " mark as complete", js: true do
#     project = create(:project)
#     task = create(:task)
#     visit projects_path
#     check "task_1"
#     expect(page).to have_css('.complete')
#   end

#   it "delete task", js: true do
#     visit projects_path
#     create_project
#     create_task
#     click_link "x"
#     visit projects_path
#     expect(page).not_to have_content("Alpha Task")
#   end
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
