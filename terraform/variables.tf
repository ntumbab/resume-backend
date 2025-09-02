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
variable "project_name" {
  type = string
  description = "GCP project id."
  default = "My CICD Project"
}

variable "billing_account" {
  type = string
  description = "Billing account id"
}