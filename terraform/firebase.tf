# Enables Firebase services for the new project created above.
resource "google_firebase_project" "default" {
  provider = google-beta
  project  = data.google_project.my_project.id

  # Waits for the required APIs to be enabled.
  depends_on = [
    google_project_service.default
  ]
}

resource "google_firestore_database" "database" {
  //project                           = google_firebase_project.default.id
  name                              = "(default)"
  location_id                       = var.region
  type                              = "FIRESTORE_NATIVE"
}

resource "google_firestore_document" "mydoc" {
  project     = google_project.default.project_id
  database    = google_firestore_database.database.name
  collection  = "data"
  document_id = "visitors"
  fields      = "{\"numberExample\":{\"integerValue\":0}}"
}