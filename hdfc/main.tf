# # ~/Terraform/compute_engine_yugabyte/main.tf (Corrected)

# module "os_login_policy" {
#   # Use a relative path, which is more portable
#   source = "./modules/compute_engine/oslogin"

#   # Use underscore naming convention for the variable
#   # The value is correctly passed as a boolean (true)
#   enable_oslogin = true
# }


# # resource "google_project_service" "essential_apis" {
# #   for_each = toset([
# #     "compute.googleapis.com",
# #     "iam.googleapis.com",
# #     "oslogin.googleapis.com"
# #   ])

# #   project            = var.project_id
# #   service            = each.key
# #   disable_on_destroy = false
# # }

# module "yugabyte_engine" {
#   source = "./modules/yugabyte_engine/linux_vm"

#   project_id                      = var.project_id
#   region                          = var.region
#   machine_name                    = "yb-db"
#   machine_type                    = "n2-standard-2"
#   instance_count                  = 1
#   machine_zone                    = ["us-central1-a", "us-central1-b"]
#   instance_image_selflink         = "projects/debian-cloud/global/images/family/debian-11"
#   enable_external_ip              = true
#   enable_shielded_vm              = true
#   instance_with_bootdisk_snapshot = false
#   enable_boot_disk                = true
#   log_disk_size                   = 50
#   log_disk_type                   = "pd-balanced"
#   snapshot_selflink               = null
#   kms_key_self_link               = null
#   labels                          = {}
#   internal_ip                     = null
#   subnetwork                      = "default"
#   network                         = "default"
#   vm_deletion_protect             = false
#   policy_name                     = "snapshot-policy"
#   utc_time                        = "00:00"
#   retention_days                  = 7
#   service_account = {
#     email  = "88846455495-compute@developer.gserviceaccount.com"
#     scopes = ["cloud-platform"]
#   }
#   metadata         = {}
#   local_disk_count = 0
#   network_tag      = ["yugabyte"]
#   shielded_instance_config = {
#     enable_secure_boot          = true
#     enable_vtpm                 = true
#     enable_integrity_monitoring = true
#   }
# }



module "test-yugabyte-cluster" {
  for_each                        = var.yugabyte_clusters
  source                          = "./modules/test"
  enable_external_ip              = each.value.enable_external_ip
  enable_shielded_vm              = each.value.enable_shielded_vm
  machine_name                    = each.value.machine_name
  instance_count                  = each.value.instance_count
  attached_disk_per_instance      = each.value.attached_disk_per_instance
  machine_zone                    = each.value.machine_zone
  policy_name                     = each.value.policy_name
  utc_name                        = each.value.utc_time
  retention_days                  = each.value.retention_days
  storage_location                = each.value.storage_location
  enable_boot_disk                = each.value.enable_boot_disk
  log_disk_size                   = each.value.log_disk_size
  log_disk_type                   = each.value.log_disk_type
  instance_with_bootdisk_snapshot = each.value.instance_with_bootdisk_snapshot
  snapshot_selflink               = each.value.snapshot_selflink
  instance_image_selflink         = each.value.instance_image_selflink
  kms_key_self_link               = each.value.kms_key_self_link
  labels                          = each.value.labels
  internal_ip                     = each.value.internal_ip
  region                          = each.value.region
  machine_type                    = each.value.machine_type
  vm_deletion_protection          = each.value.vm_deletion_protection
  network_tags                    = each.value.network_tags
  network                         = each.value.network
  subnetwork                      = each.value.subnetwork
  service_account                 = each.value.service_account
  metadata                        = each.value.metadata
  local_disk_count                = each.value.local_disk_count
  shielded_instance_config        = each.value.shielded_instance_config
}



