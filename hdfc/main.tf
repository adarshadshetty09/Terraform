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



