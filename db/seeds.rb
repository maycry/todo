# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create name: "Alpha"
Project.create name: "Beta"
Project.create name: "Gamma"
Project.create name: "Tetta"
Task.create name: "Task number one", status: "incomplete", project_id: "1", position: 1
Task.create name: "Task number two", status: "incomplete", project_id: "1", position: 2
Task.create name: "Task number three", status: "incomplete", project_id: "1", position: 3
Task.create name: "Task number one", status: "incomplete", project_id: "2", position: 1
Task.create name: "Task number two", status: "incomplete", project_id: "2", position: 2
Task.create name: "Task number one", status: "incomplete", project_id: "3", position: 1
Task.create name: "Task number two", status: "incomplete", project_id: "3", position: 2
Task.create name: "Task number three", status: "incomplete", project_id: "3", position: 3
Task.create name: "Task number one", status: "incomplete", project_id: "4", position: 1
Task.create name: "Task number two", status: "incomplete", project_id: "4", position: 2