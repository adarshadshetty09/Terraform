#############################################
# Create Compute Engine Disk
#############################################

resource "google_compute_disk" "gce_disk" {
    count = var.vim_with_data_disk == true && var.attach_existing_disk == false ? 1 : 0
  name  = var.data_disk_info["disk_name"]
  size = var.data_disk_info["disk_size_gb"]
  type  = var.data_disk_info["disk_type"]
  snapshot = var.data_disk_with_snapshot ? "${var.data_disk_info["data_disk_snapshot_selflink"]}" : null
  zone  = var.machine_zone

  disk_encryption_key {
    kms_key_self_link = var.kms_key_self_link
  }

  labels = merge(
    var.disk_labels,
    tomap(
        {
            "type" = "boot",
        }
    )
  )
  physical_block_size_bytes = 4096
  lifecycle {
    prevent_destroy = false
  }
}


############################################
# Google Compute VM & Data Disk Attachment
############################################

resource "google_compute_attached_disk" "gce_disk_attach" {
  for_each = var.vim_with_data_disk == true && var.attach_existing_disk == true ? toset(var.data_disk_selflink) : (toset([google_compute_disk.gce_disk[0].name]))
  disk = each.value
  instance = var.compute_instance_id
}


##############################################
# Snapshot Policy Attachment for Attahed Disk 
###############################################

resource "google_compute_disk_resource_policy_attachment" "data_disk_policy_attach" {
  for_each = var.vim_with_data_disk == true && var.attach_existing_disk == true ? toset(var.data_disk_name): toset([google_compute_disk.gce_disk[0].name])
  name = var.snapshot_policy_name
  disk = each.value
  zone = var.machine_zone
}