##################
# Locals
##################

locals {
  # ✅ External IP control
  external_ip_add = var.enable_external_ip ? 1 : 0
  access_config   = local.external_ip_add != 0 ? [true] : []

  # ✅ Shielded VM control
  shielded_vm_configs = var.enable_shielded_vm ? [true] : []

  # ✅ Instance name generation
  instance_name = [
    for i in range(1, var.instance_count + 1) :
    format("%s%d", var.machine_name, i)
  ]

  # ✅ Disk name generation per instance
  disk_name = [
    for idx, name in local.instance_name :
    [for i in range(1, var.attached_disk_per_instance + 1) :
      format("%s-persistent-disk%d", name, i)
    ]
  ]

  # ✅ Flattened disk list
  attached_disk_names = flatten(local.disk_name)

  # ✅ Flattened instance name repetition (for each disk)
  instance = flatten([
    for idx, name in local.instance_name :
    [for i in range(1, var.attached_disk_per_instance + 1) : name]
  ])

  # ✅ Zone distribution (round-robin)
  zones = flatten([
    for idx, zone in range(var.instance_count) :
    [for i in range(var.attached_disk_per_instance) :
      element(var.machine_zone, zone % length(var.machine_zone))
    ]
  ])
}


##############################
# Snapshot Policy Creation 
##############################\

resource "google_compute_resource_policy" "snapshot_policy" {
  name = var.policy_name

#   region = "us-central1"
  snapshot_schedule_policy {
    schedule {
        hourly_schedule {
          hours_in_cycle = 23
          start_time = var.utc_name  # In UTC 
        }
    }

    retention_policy {
      max_retention_days = var.retention_days
      on_source_disk_delete = "KEEP_AUTO_SNAPSHOTS"
    }
    snapshot_properties {
      storage_locations = [var.storage_location]
    }
  }
}


###############################################
# Google Compute VM Boot Disk Creation 
###############################################

resource "google_compute_disk" "boot_gce_disk" {
  count = var.enable_boot_disk == true ? var.instance_count: 0
  name = "${var.machine_name}${count.index+1}-boot-disk"
  size = var.log_disk_size
  type = var.log_disk_type
  zone = element(var.machine_zone, count.index % length(var.machine_zone))
  snapshot = var.instance_with_bootdisk_snapshot == true ? "${var.snapshot_selflink}":null
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


##############################################
# Snapshot Policy Attachment for Boot Disks
##############################################

resource "google_compute_disk_resource_policy_attachment" "boot_diskpolicy_attach" {
    count = var.enable_boot_disk == true ? var.instance_count : 0
    name = google_compute_resource_policy.snapshot_policy.name
    disk = google_compute_disk.boot_gce_disk[count.index].name
    zone = element(var.machine_zone,count.index % length(var.machine_zone))
    depends_on = [ google_compute_disk.boot_gce_disk ]
}

# #############################
# Google Static Internal IP 
###############################

resource "google_compute_address" "static_internal_ip_address" {
  count = var.instance_count
  name = "${var.machine_name}-int-ip-${count.index + 1}"
  address_type = "INTERNAL"
  address = element(var.internal_ip , count.index % length(var.internal_ip))
  subnetwork = var.subnetwork
  lifecycle {
    prevent_destroy = false
  }
}



# ##################################
# Google Static External IP 
####################################

resource "google_compute_address" "static_external_ip_address" {
  count  = var.instance_count
  name   = "${var.machine_name}${count.index + 1}-ext-ip"
  region = var.region
  lifecycle {
    prevent_destroy = false
  }
}



#####################################
# Google Compute VM 
#####################################

resource "google_compute_instance" "gce_vm" {
  count = var.instance_count
  name = local.instance_name[count.index]
  machine_type = var.machine_type
  zone = element(var.machine_zone,count.index % length(var.machine_zone))
  allow_stopping_for_update = true
  deletion_protection = var.vm_deletion_protection 
  tags = var.network_tags

  boot_disk {
    auto_delete = true
    source = google_compute_disk.boot_gce_disk[count.index].id
    device_name = google_compute_disk.boot_gce_disk[count.index].name
  }

network_interface {
  network    = var.network
  subnetwork = var.subnetwork
  network_ip = google_compute_address.static_internal_ip_address[count.index].address

dynamic "access_config" {
  for_each = local.access_config
  content {
    nat_ip       = google_compute_address.static_external_ip_address[count.index].address
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
            "resource" = "gce_vm"
        }
    )
  )
  dynamic "service_account" {
    for_each = [var.service_account]
    content {
      email = lookup(service_account.value, "email",null)
      scopes = lookup(service_account.value, "scopes",null)
    }
  }

  metadata = var.metadata

  dynamic "scratch_disk" {
    for_each = range(var.local_disk_count)
    content {
      interface = "NVME"
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



