variable "region" {
  type = string
  description = "Region used for resource deployment"
  default = "northamerica-northeast2"
}

variable "project_id" {
  type = string
  description = "GCP project id."
  default = "resume-challenge-project"
}

variable "project_name" {
  type = string
  description = "GCP project name."
  default = "Resume Challenge Project"
}

variable "billing_account" {
  type = string
  description = "Billing account id"
}