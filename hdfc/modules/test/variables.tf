variable "enable_external_ip" {
  default = true
}

variable "enable_shielded_vm" {
  default = false
}

variable "machine_name" {
  default = "web"
}

variable "instance_count" {
  default = 3
}

variable "attached_disk_per_instance" {
  default = 2
}

variable "machine_zone" {
  default = ["us-central1-a", "us-central1-b"]
}

variable "policy_name" {
  
}

variable "utc_name" {
  
}

variable "retention_days" {
  
}
variable "storage_location" {
  
}

variable "log_disk_size" {
  
}

variable "log_disk_type" {
  
}

variable "instance_with_bootdisk_snapshot" {
  
}
variable "snapshot_selflink" {
  
}

variable "instance_image_selflink" {
  
}

variable "kms_key_self_link" {
  
}

variable "labels" {
  
}

variable "enable_boot_disk" {
  default = false 
}

variable "subnetwork" {
  
}

variable "internal_ip" {
  
}

variable "region" {
  
}

variable "machine_type" {
  
}

variable "vm_deletion_protection" {
  
}

variable "network_tags" {
  
}

variable "network" {
  
}

variable "service_account" {
  
}

variable "metadata" {
  
}

variable "local_disk_count" {
  
}

variable "shielded_instance_config" {
  
}