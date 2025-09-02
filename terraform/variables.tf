variable "region" {
  type = string
  description = "Region used for resource deployment"
  default = "northamerica-northeast2"
}

variable "project_id" {
  type = string
  description = "GCP project id."
  default = "cicd-project"
}

variable "billing_account" {
  type = string
  description = "Billing account id"
}