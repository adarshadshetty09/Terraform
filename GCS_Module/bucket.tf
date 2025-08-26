module "gcs" {
  source     = "./cloud_storage"
  project_id = var.project_id
  location   = var.location
  name       = var.bucket_name
  labels     = var.bucket_labels

  set_roles  = var.set_roles
  iam_members = var.set_roles ? var.iam_members : {}

  public_access_prevention = var.public_access_prevention
  storage_class            = var.storage_class
  uniform_bucket_level_access = var.uniform_bucket_level_access
  versioning                  = var.versioning
  force_destroy              = var.force_destroy
  retention_policy           = var.retention_policy
  encryption                 = var.bucket_encryption
  custom_placement_config    = var.custom_placement_config
}
