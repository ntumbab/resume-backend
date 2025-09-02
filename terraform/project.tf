# Creates a new Google Cloud project.
/*resource "google_project" "default" {
  provider   = google-beta.no_user_project_override

  name       = "Resume Challenge"
  project_id = "resume-challenge-project"
  # Required for any service that requires the Blaze pricing plan
  # (like Firebase Authentication with GCIP)
  billing_account = var.billing_account

  # Required for the project to display in any list of Firebase projects.
  labels = {
    "firebase" = "enabled"
  }
}*/

# Enables required APIs.
resource "google_project_service" "default" {
  provider = google-beta.no_user_project_override
  project  = data.google_project.my_project.id
  for_each = toset([
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "firebase.googleapis.com",
    "firestore.googleapis.com",
    "cloudfunctions.googleapis.com",
    "run.googleapis.com",
    "artifactregistry.googleapis.com",
    # Enabling the ServiceUsage API allows the new project to be quota checked from now on.
    "serviceusage.googleapis.com",
  ])
  service = each.key

  # Don't disable the service if the resource block is removed by accident.
  disable_on_destroy = false
}

resource "google_project_iam_member" "cloudfunctions_admin" {
  project = data.google_project.my_project.id
  role    = "roles/cloudfunctions.admin"
  member  = "user:bertrand.ntumba@gmail.com"
}