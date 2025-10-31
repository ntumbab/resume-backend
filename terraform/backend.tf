terraform {
  backend "gcs" {
    bucket = "resume-backend-terraform-state"
    prefix = "terraform/state"
    
  }
}