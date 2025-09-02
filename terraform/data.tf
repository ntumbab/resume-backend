data "google_project" "my_project" {
  project_id = "resume-challenge-project"
}


output "project_name" {
  value = data.google_project.my_project.name
}