terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.49.0"
    }
  }
}


provider "google" {
  project = "spheric-mesh-465208-h9"
  region  = "us-central1"
}


# Declare variables
variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "buckets" {
  description = "Map of buckets to create"
  type = map(object({
    location          = string
    bucket_encryption = object({ default_kms_key_name = string })
    bucket_labels     = map(string)
    set_roles         = bool
    iam_members = map(object({
      role   = string
      member = list(string)
    }))
    custom_placement_config = optional(object({
      data_locations = list(string)
    }))
    retention_policy = optional(object({
      is_locked        = bool
      retention_period = number
    }))
  }))
}

resource "google_storage_bucket" "this" {
  for_each = var.buckets

  name     = each.key
  project  = var.project_id
  location = each.value.location

  force_destroy               = true
  public_access_prevention    = "enforced"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = false

  labels = each.value.bucket_labels

  versioning {
    enabled = true
  }

  dynamic "encryption" {
    for_each = each.value.bucket_encryption == null ? [] : [each.value.bucket_encryption]
    content {
      default_kms_key_name = each.value.bucket_encryption.default_kms_key_name
    }
  }

  dynamic "custom_placement_config" {
    for_each = try(each.value.custom_placement_config, null) == null ? [] : [each.value.custom_placement_config]
    content {
      data_locations = each.value.custom_placement_config.data_locations
    }
  }

  dynamic "retention_policy" {
    for_each = try(each.value.retention_policy, null) == null ? [] : [each.value.retention_policy]
    content {
      is_locked        = each.value.retention_policy.is_locked
      retention_period = each.value.retention_policy.retention_period
    }
  }
}
