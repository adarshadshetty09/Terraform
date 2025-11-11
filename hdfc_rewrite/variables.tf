variable "network_project_id" {
  description = "The project ID where the network resources are located"
  type        = string
}

##############################################################
# Root Module Variables
##############################################################

# GCP Project ID
variable "project_id" {
  description = "The GCP project ID where resources will be created."
  type        = string
}

# GCP Region
variable "region" {
  description = "Default region for GCP resources."
  type        = string
}

# Yugabyte Cluster Definitions
variable "yugabyte_clusters" {
  description = "Configuration for yugabyte DB nodes"
}

variable "yugabyte_control_node" {
  description = "Configuration for yugabyte control node"
}
