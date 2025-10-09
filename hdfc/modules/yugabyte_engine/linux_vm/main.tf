locals {
  external_ip_add     = var.enable_external_ip ? 1 : 0
  access_config       = local.external_ip_add != 0 ? [true] : []
  shielded_vm_configs = var.enable_shielded_vm ? [true] : []

  instance_name = [
    for i in range(1, var.instance_count + 1) :
    format("%s%d", var.machine_name, i)
  ]

  disk_name = [
    for name in local.instance_name :
    [for i in range(1, var.attached_disks_per_instance + 1) :
      format("%s-persistent-disk%d", name, i)
    ]
  ]

  attached_disks_names = flatten(local.disk_name)

  instance = flatten([
    for name in local.instance_name :
    [for i in range(1, var.attached_disks_per_instance + 1) : name]
  ])

  Zones = flatten([
    for idx in range(var.instance_count) : [
      for i in range(var.attached_disks_per_instance) :
      element(var.machine_zone, idx % length(var.machine_zone))
    ]
  ])
}


##################################
# Snapshot Policy Creation 
##################################

resource "google_compute_resource_policy" "snapshot_policy" {
  name = var.policy_name
  snapshot_schedule_policy {
    schedule {
      hourly_schedule {
        hours_in_cycle = 23
        start_time = var.utc_time # In UTC
      }
    }
    retention_policy {
      max_retention_days = var.retention_days
      on_source_disk_delete = "KEEP_AUTO_SNAPSHOTS"
    }
  }
}



#######################################
# Google Compute VM Boot Disk Creation 
#######################################
resource "google_compute_disk" "boot_yba_disk" {
  count = var.enable_boot_disk == true ? var.instance_count: 0
  name = "${var.machine_name}${count.index + 1}-boot-disk"
  size = var.log_disk_size
  type = var.log_disk_type
  zone = element(var.machine_zone,count.index % length(var.machine_zone))
  snapshot = var.instance_with_bootdisk_snapshot == true ? "${var.snapshot_selflink}": null
  image = var.instance_with_bootdisk_snapshot == false ? "${var.instance_image_selflink}" : null

  disk_encryption_key {
    kms_key_self_link = var.kms_key_self_link
  }

  labels = merge(
    var.labels,
    tomap(
        {
            "type" = "boot",
            "resource" = "disk"
        }
    )
  )
  physical_block_size_bytes = 4096
}


##############################
# Google Static Internal IP 
##############################

resource "google_compute_address" "static_internal_ip_address" {
    count = var.instance_count
  name = "${var.machine_name}-int-ip-${count.index +1}"
  address_type = "INTERNAL"
  address = var.internal_ip 
  subnetwork = var.subnetwork
  region = var.region 
  lifecycle {
    prevent_destroy = false
  }
}


##############################
# Google Static External IP
##############################

resource "google_compute_address" "static_external_ip_address" {
  count = local.external_ip_add
  name = "${var.machine_name}-ext-ip"
  address_type = "EXTERNAL"
  region = var.region
  lifecycle {
    prevent_destroy = false
  }
}

##################################
# Google Compute VM 
##################################

resource "google_compute_instance" "gce_vm" {
  count = var.instance_count
  name = local.instance_name[count.index]
  machine_type = var.machine_type
  zone = element(var.machine_zone, count.index % length(var.var.machine_zone))
  allow_stopping_for_update = true
  deletion_protection = var.vm_deletion_protect
  tags = var.network_tag

  boot_disk {
    auto_delete = false 
    source = google_compute_disk.boot_yba_disk[count.index].id
    device_name = google_compute_disk.boot_yba_disk[count.index].name
  }

  network_interface {
    network = var.network 
    subnetwork = var.subnetwork
    network_ip = google_compute_address.static_internal_ip_address

     dynamic "access_config" {
    for_each = local.access_config
    content {
        nat_ip = google_compute_address.static_external_ip_address[0].address
        network_tier = "PREMIUM"
    }
  }
  }
 
  lifecycle {
    ignore_changes = [ attached_disk ]
  }
  labels = merge(
    var.labels,
    tomap(
        {
            "resources" = "gce_vm"
        }
    )
  )
  dynamic "service_account" {
    for_each = [var.service_account]
    content {
      email = lookup(service_account.value,"email",null)
      scopes = lookup(service_account.value,"scopes",null)
    }
  }

  metadata = var.metadata

  dynamic "scratch_disk" {
    for_each = range(var.local_disk_count)
    content {
      interface = "NVM"
    }
  }

  dynamic "shielded_instance_config" {
    for_each = local.shielded_vm_configs
    content {
      enable_secure_boot = lookup(var.shielded_instance_config, "enable_secure_boot", shielded_instance_config.value)
      enable_vtpm = lookup(var.shielded_instance_config, "enable_vtpm", shielded_instance_config.value)
      enable_integrity_monitoring = lookup(var.shielded_instance_config, "enable_integrity_monitoring", shielded_instance_config.value)
    }
  }
}