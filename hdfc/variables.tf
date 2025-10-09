variable "project_id" {
  description = "The project ID to deploy resources into"
  type        = string
}

variable "network_project_id" {
  description = "The project ID where the network resources are located"
  type        = string
}

variable "region" {
  description = "Region to deploy resources"
  type        = string
}
