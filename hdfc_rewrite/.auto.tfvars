###### Global #########
project_id = "apt-index-474313-e9"
network_project_id = "default"
region = "us-central1"

# kms_key_self_link = " "

yugabyte_clusters = {
  cluster1 = {
    enable_external_ip              = true
    enable_shielded_vm              = true
    machine_name                    = "yb-db"
    instance_count                  = 3
    attached_disks_per_instance     = 4     # ✅ FIXED LINE
    attached_persistent_disk_sizes  = [100, 200, 100, 50]
    machine_zone                    = ["us-central1-a", "us-central1-b"]
    policy_name                     = "snapshot-policy"
    utc_time                        = "00:00"
    retention_days                  = 7
    storage_locations               = "us"
    enable_boot_disk                = true
    boot_disk_size                   = 10
    boot_disk_type                  = "pd-balanced"
    instance_with_bootdisk_snapshot = false
    snapshot_selflink               = null
    instance_image_selflink         = "projects/debian-cloud/global/images/family/debian-11"
    kms_key_self_link               = null
    labels                          = {}
    internal_ip                     = ["10.128.0.10", "10.128.0.11","10.128.0.12"]
    region                          = "us-central1"
    machine_type                    = "n2-standard-2"
    vm_deletion_protection          = false
    network_tags                    = ["yugabyte"]
    network                         = "default"
    subnetwork                      = "default"
    service_account = {
      email  = "88846455495-compute@developer.gserviceaccount.com"
      scopes = ["cloud-platform"]
    }
    metadata          = {}
    local_disk_count  = 0
    shielded_instance_config = {
      enable_secure_boot          = true
      enable_vtpm                 = true
      enable_integrity_monitoring = true
    }
  }
}
