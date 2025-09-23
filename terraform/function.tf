/*resource "google_storage_bucket" "function_bucket" {
  name     = "${var.project_id}-function-bucket"
  location = var.region
}*/

/*resource "google_storage_bucket_object" "function_archive" {
  name   = "function.zip"
  //bucket = google_storage_bucket.function_bucket.name
  bucket = data.google_storage_bucket.function_bucket.name
  source = "../function/function.zip"
}*/

/*
resource "google_cloudfunctions2_function" "helloHttp" {
  name        = "visitor-function"
  description = "Function reading and updating the visitor count"
  location = var.region

build_config {
    runtime = "nodejs20"
    entry_point = "helloHttp"  # Set the entry point 
    source {
      storage_source {
        //bucket = google_storage_bucket.function_bucket.name
        bucket = data.google_storage_bucket.function_bucket.name
        object = google_storage_bucket_object.function_archive.name
      }
    }
  }
}


data "google_iam_policy" "admin" {
  binding {
    role = "roles/cloudfunctions.invoker"
    members = [
      "user:bertrand.ntumba@gmail.com",
    ]
  }
}


resource "google_cloud_run_service_iam_member" "helloHttp_public" {
  location = google_cloudfunctions2_function.helloHttp.location
  project  = google_cloudfunctions2_function.helloHttp.project
  service  = google_cloudfunctions2_function.helloHttp.name

  role   = "roles/run.invoker"
  member = "allUsers"
}

output "function_url" {
  value = google_cloudfunctions2_function.helloHttp.url
}
*/