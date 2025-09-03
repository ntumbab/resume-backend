data "google_project" "my_project" {
  project_id = "resume-challenge-project"
}


output "project_name" {
  value = data.google_project.my_project.name
}

data "google_storage_bucket" "function_bucket" {
  name = "${var.project_id}-function-bucket"
  location = var.region
}

output "bucket_name" {
  value = data.google_storage_bucket.function_bucket.name
}