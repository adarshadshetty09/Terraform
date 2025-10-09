# ~/Terraform/compute_engine_yugabyte/main.tf (Corrected)

module "os_login_policy" {
  # Use a relative path, which is more portable
  source = "./modules/compute_engine/oslogin"

  # Use underscore naming convention for the variable
  # The value is correctly passed as a boolean (true)
  enable_oslogin = true
}


# resource "google_project_service" "essential_apis" {
#   for_each = toset([
#     "compute.googleapis.com",
#     "iam.googleapis.com",
#     "oslogin.googleapis.com"
#   ])

#   project            = var.project_id
#   service            = each.key
#   disable_on_destroy = false
# }

module "yugabyte_engine" {
  source = "./modules/yugabyte_engine/linux_vm"

  project_id                      = var.project_id
  region                          = var.region
  machine_name                    = "yb-db"
  machine_type                    = "n2-standard-2"
  instance_count                  = 1
  machine_zone                    = ["us-central1-a", "us-central1-b"]
  instance_image_selflink        = "projects/debian-cloud/global/images/family/debian-11"
  enable_external_ip             = true
  enable_shielded_vm             = true
  instance_with_bootdisk_snapshot = false
  enable_boot_disk               = true
  log_disk_size                  = 50
  log_disk_type                  = "pd-balanced"
  snapshot_selflink              = null
  kms_key_self_link              = null
  labels                         = {}
  internal_ip                    = null
  subnetwork                     = "default"
  network                        = "default"
  vm_deletion_protect            = false
  policy_name                    = "snapshot-policy"
  utc_time                       = "00:00"
  retention_days                 = 7
  service_account                = {
    email  = "88846455495-compute@developer.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
  metadata                       = {}
  local_disk_count               = 0
  network_tag                    = ["yugabyte"]
  shielded_instance_config       = {
    enable_secure_boot           = true
    enable_vtpm                  = true
    enable_integrity_monitoring  = true
  }
}






