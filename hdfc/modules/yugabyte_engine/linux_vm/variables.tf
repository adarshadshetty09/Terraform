#####################
# Global Variables
#####################

variable "project_id" {
  type        = string
  description = "The GCP project ID"
}

variable "enable_external_ip" {
  type        = bool
  description = "Instance External IP required or not"
  default     = false
}

variable "instance_count" {
  default = 1
}

variable "machine_name" {
  description = "hostname of instance"
}

variable "attached_disks_per_instance" {
  default = 1
}

variable "enable_shielded_vm" {
  default     = true
  description = "Whether to enable the shielded VM configuration on the instance. Note the instance image must support shielded VMs. "
}

variable "machine_type" {
  description = "Machine type to create , e.g n1-standard-1"
}

variable "instance_image_selflink" {
  description = "Compute Image to use , e.g. /project//////. Get it grom console REST Response."
}

variable "snapshot_selflink" {
  description = "The source snapshot used to create this disk. You can provide this as a partial or full URL to the resource. If the another project than this disk, you must supply a full URL."
}

variable "machine_zone" {
  description = "Zone in which the instance will be present"
}

variable "network_tag" {
  description = "Network tags, provide as a list"
}


variable "policy_name" {
  description = "policy name"
}


variable "utc_time" {
  description = "policy_name"
}

variable "retention_days" {
  description = "policy_name"
}


variable "enable_boot_disk" {
  description = "value"
}

variable "log_disk_size" {
  description = "value"
}

variable "log_disk_type" {
  description = "value"
}

variable "instance_with_bootdisk_snapshot" {
  description = "value"
}

variable "kms_key_self_link" {
  description = "value"
}

variable "labels" {
  description = "value"
}

variable "internal_ip" {
  description = "value"
}

variable "internal_ip_base" {
  description = "Base IP in subnet"
  type        = string
  default     = "10.128.0.5"
}


variable "subnetwork" {
  description = "value"
}

variable "region" {
  description = "value"
}

variable "vm_deletion_protect" {
  description = "value"
}
variable "network" {
  description = "value"
}


variable "service_account" {
  description = "value"
}

variable "metadata" {
  description = "value"
}

variable "local_disk_count" {
  description = "value"
}

variable "shielded_instance_config" {
  
}

