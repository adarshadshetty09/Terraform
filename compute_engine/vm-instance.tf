provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project
  region      = var.region
  zone        = var.zone
}

resource "google_compute_network" "cutom_vpc" {
  name                    = "${var.instance_name}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "custom_subnet" {
  name          = "${var.instance_name}-subnet"
  ip_cidr_range = "10.10.0.0/24"
  region        = var.region
  network       = google_compute_network.cutom_vpc.id
}


resource "google_compute_disk" "extra_disk" {
  name = "${var.instance_name}-extra-disk"
  type = "pd-standard"
  zone = var.zone
  size = var.disk_size
}


resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  allow_stopping_for_update = true # Very important for while doing the changes on the running resources.

  boot_disk {
    initialize_params {
      image = var.source_image
    }
  }

  attached_disk {
    source      = google_compute_disk.extra_disk.id
    device_name = "extra-disk"
  }

  network_interface {
    network    = google_compute_network.cutom_vpc.name
    subnetwork = google_compute_subnetwork.custom_subnet.name

    access_config {
      // Ephemeral public IP
    }
  }
  metadata_startup_script = <<-EOT
    #!/bin/bash

    DISK_DEVICE="/dev/disk/by-id/google-extra-disk"
    MOUNT_POINT="/mnt/data-disk"

    # Wait for disk to be available
    while [ ! -e "$DISK_DEVICE" ]; do sleep 1; done

    # Format disk if not already formatted
    if ! blkid $DISK_DEVICE; then
      mkfs.ext4 -F $DISK_DEVICE
    fi

    mkdir -p $MOUNT_POINT
    mount -o discard,defaults $DISK_DEVICE $MOUNT_POINT

    # Add to fstab if not already present
    grep -q "$DISK_DEVICE" /etc/fstab || echo "$DISK_DEVICE $MOUNT_POINT ext4 discard,defaults 0 2" >> /etc/fstab
  EOT

  metadata = {
    ssh-keys = "test:${file(var.public_ssh_key_path)}"
  }
}
