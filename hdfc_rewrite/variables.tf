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

# KMS Key Self Link
variable "kms_key_self_link" {
  description = "The full resource path of the KMS crypto key to encrypt disks (CMEK)"
  type        = string
  default     = null
}

# GCP Region
variable "region" {
  description = "Default region for GCP resources."
  type        = string
}

# Yugabyte Cluster Definitions
variable "yugabyte_clusters_project1" {
  description = "Configuration For Yugabyte Cluster For Project-1"
}


variable "nfs" {
  description = "Configuration For Yugabyte Cluster For Project-1"
}



