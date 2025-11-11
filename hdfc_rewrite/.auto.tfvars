###### Global #########
project_id = "apt-index-474313-e9"
network_project_id = "default"
region = "us-central1"

# kms_key_self_link = " "

# yugabyte_clusters = {
#   cluster1 = {
#     enable_external_ip              = true
#     enable_shielded_vm              = true
#     machine_name                    = "yb-db"
#     instance_count                  = 1
#     attached_disks_per_instance     = 4     # ✅ FIXED LINE
#     # enable_shared_disk              = false
#     enable_yugabyte_disk            = true
#     enable_data1_disk               = false
#     enable_shared_disk              = false
#     enable_wal1_disk                = false
#     attached_persistent_disk_sizes  = [11,12,13,14]
#     machine_zone                    = ["us-central1-a", "us-central1-b"]
#     policy_name                     = "db-snapshot-policy"
#     utc_time                        = "00:00"
#     retention_days                  = 7
#     storage_locations               = "us"
#     enable_boot_disk                = true
#     boot_disk_size                   = 10
#     boot_disk_type                  = "pd-balanced"
#     instance_with_bootdisk_snapshot = false
#     snapshot_selflink               = null
#     instance_image_selflink         = "projects/debian-cloud/global/images/family/debian-11"
#     kms_key_self_link               = null
#     labels                          = {}
#     internal_ip                     = ["10.0.0.10","10.0.0.11"]
#     region                          = "us-central1"
#     machine_type                    = "n2-standard-2"
#     vm_deletion_protection          = false
#     network_tags                    = ["yugabyte"]
#     network                         = "vpc-yugabyte-terraform-cluster"
#     subnetwork                      = "yugabyte-sub-1"
#     service_account = {
#       email  = "88846455495-compute@developer.gserviceaccount.com"
#       scopes = ["cloud-platform"]
#     }
#     metadata          = {}
#     local_disk_count  = 0
#     shielded_instance_config = {
#       enable_secure_boot          = true
#       enable_vtpm                 = true
#       enable_integrity_monitoring = true
#     }
#   }
# }


yugabyte_clusters = {
  yba-control-node = {
    enable_external_ip              = false
    enable_shielded_vm              = true
    machine_name                    = "yba"
    instance_count                  = 1
    attached_disks_per_instance     = 4
    enable_yugabyte_disk            = true
    enable_data1_disk               = false
    enable_shared_disk              = false
    enable_wal1_disk                = false
    attached_persistent_disk_sizes  = [11,12,13,14]
    machine_zone                    = ["us-central1-a", "us-central1-b"]
    policy_name                     = "yba-snapshot-policy"
    utc_time                        = "00:00"
    retention_days                  = 7
    storage_locations               = "us"
    enable_boot_disk                = true
    boot_disk_size                  = 10
    boot_disk_type                  = "pd-balanced"
    instance_with_bootdisk_snapshot = false
    snapshot_selflink               = null
    instance_image_selflink         = "projects/debian-cloud/global/images/family/debian-11"
    kms_key_self_link               = null
    labels                          = {}
    internal_ip                     = ["10.0.0.10"]
    region                          = "us-central1"
    machine_type                    = "n2-standard-2"
    vm_deletion_protection          = false
    network_tags                    = ["yugabyte"]
    network                         = "vpc-yugabyte-terraform-cluster"
    subnetwork                      = "yugabyte-sub-1"
    service_account = {
      email  = "88846455495-compute@developer.gserviceaccount.com"
      scopes = ["cloud-platform"]
    }
    metadata = {}
    local_disk_count = 0
    shielded_instance_config = {
      enable_secure_boot          = true
      enable_vtpm                 = true
      enable_integrity_monitoring = true
    }
  },

  yba-db-node = {
    enable_external_ip              = false
    enable_shielded_vm              = true
    machine_name                    = "yb-db-node"
    instance_count                  = 2
    attached_disks_per_instance     = 4
    enable_yugabyte_disk            = false
    enable_data1_disk               = true
    enable_shared_disk              = true
    enable_wal1_disk                = true
    attached_persistent_disk_sizes  = [11,12,13,14]
    machine_zone                    = ["us-central1-a", "us-central1-b"]
    policy_name                     = "db-snapshot-policy"
    utc_time                        = "00:00"
    retention_days                  = 7
    storage_locations               = "us"
    enable_boot_disk                = true
    boot_disk_size                  = 10
    boot_disk_type                  = "pd-balanced"
    instance_with_bootdisk_snapshot = false
    snapshot_selflink               = null
    instance_image_selflink         = "projects/debian-cloud/global/images/family/debian-11"
    kms_key_self_link               = null
    labels                          = {}
    internal_ip                     = ["10.0.0.11","10.0.0.12"]
    region                          = "us-central1"
    machine_type                    = "n2-standard-2"
    vm_deletion_protection          = false
    network_tags                    = ["yugabyte"]
    network                         = "vpc-yugabyte-terraform-cluster"
    subnetwork                      = "yugabyte-sub-1"
    service_account = {
      email  = "88846455495-compute@developer.gserviceaccount.com"
      scopes = ["cloud-platform"]
    }
    metadata = {}
    local_disk_count = 0
    shielded_instance_config = {
      enable_secure_boot          = true
      enable_vtpm                 = true
      enable_integrity_monitoring = true
    }
  }
}

