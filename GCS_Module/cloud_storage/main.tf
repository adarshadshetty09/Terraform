resource "google_storage_bucket" "bucket" {
  name                        = var.name
  project                     = var.project_id
  location                    = var.location
  force_destroy               = var.force_destroy
  public_access_prevention    = var.public_access_prevention
  storage_class               = var.storage_class
  uniform_bucket_level_access = var.uniform_bucket_level_access
  labels                      = var.labels

  versioning {
    enabled = var.versioning
  }

  dynamic "retention_policy" {
    for_each = var.retention_policy == null ? [] : [var.retention_policy]
    content {
      is_locked        = retention_policy.value.is_locked
      retention_period = retention_policy.value.retention_period
    }
  }

  dynamic "encryption" {
    for_each = var.encryption == null ? [] : [var.encryption]
    content {
      default_kms_key_name = encryption.value.default_kms_key_name
    }
  }

  dynamic "custom_placement_config" {
    for_each = var.custom_placement_config == null ? [] : [var.custom_placement_config]
    content {
      data_locations = custom_placement_config.value.data_locations
    }
  }
}

resource "google_storage_bucket_iam_binding" "bucket_permission" {
  for_each = var.set_roles ? var.iam_members : {}
  bucket   = google_storage_bucket.bucket.name
  role     = each.value.role
  members  = each.value.member
}
