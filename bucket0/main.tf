terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.49.0"
    }
  }
}


provider "google" {
  project = var.project_id
  region  = var.region
}



variable "region" {
  type = string
  # default = "asia-south1"  # or leave it out if it's already set in .auto.tfvars
}


variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
}

variable "project_id" {
  description = "The ID of the project to create the bucket in."
  type        = string
}

variable "location" {
  description = "The location of the bucket."
  type        = string
}

variable "public_access_prevention" {
  description = "Prevents public access to a bucket. Acceptable values are inherited or enforced. If inherited, the bucket uses public access prevention, only if the bucket is subject."
  type        = string
  default     = "enforced"
}

variable "storage_class" {
  description = "A Set of key/value label pair to assign to the bucket."
  type        = map(string)
  default     = null
}

variable "versioning" {
  description = "While set tot true, versioning is fully enabled for this bucket."
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "When deleting a bucket, this boolean option will delete all the contained objects. If false, Terraform will fail to delete bucket which contain objects."
  type        = bool
  default     = false

}
variable "retention_policy" {
  type = object({
    is_locked        = bool
    retention_period = number
  })
  default = {
    is_locked        = false
    retention_period = 86400 # 1 day in seconds
  }
}

variable "bucket_encryption" {
  description = "A Cloud KMS key that will be used to encrypt objects inserted into this bucket."
  type = object({
    default_kms_key_name = string
  })

  default = null

}

variable "custom_placement_config" {
  description = "Configuration of the bucket's custom location in a dual-region bucket setup. If the bucket is designated a single or multi-region. The Variable are null."
  type = object({
    data_locations = list(string)
  })
  default = null
}

variable "iam_members" {
  description = "The list pf IAM Members to grant permission on the bucket."
  default     = {}
}

variable "bucket_labels" {
  type    = map(string)
  default = {}
}

variable "set_roles" {
  type = bool
}


resource "google_storage_bucket" "test" {
  name                        = var.bucket_name
  project                     = var.project_id
  location                    = var.location
  force_destroy               = true
  public_access_prevention    = "enforced"
  storage_class               = "Standard"
  uniform_bucket_level_access = false

  labels = var.bucket_labels

  versioning {
    enabled = true
  }

  dynamic "retention_policy" {
    for_each = var.retention_policy != null ? [var.retention_policy] : []
    content {
      is_locked        = var.retention_policy.is_locked
      retention_period = var.retention_policy.retention_period
    }
  }

  dynamic "encryption" {
    for_each = var.bucket_encryption == null ? [] : [var.bucket_encryption]
    content {
      default_kms_key_name = var.bucket_encryption.default_kms_key_name
    }
  }

  dynamic "custom_placement_config" {
    for_each = var.custom_placement_config == null ? [] : [var.custom_placement_config]
    content {
      data_locations = var.custom_placement_config.data_locations
    }
  }
}


resource "google_storage_bucket_iam_binding" "bucket_permission" {
  for_each = var.set_roles ? var.iam_members : {}
  bucket   = google_storage_bucket.test.name
  role     = each.value.role
  members  = each.value.member
}



output "bucket" {
  description = "The created storage bucket"
  value       = google_storage_bucket.test
}