variable "compute_instance_id" {
  description = "Compute instance id"
}

variable "data_disk_info" {
  description = "The information of Data disk of GCE instance"
}

variable "disk_labels" {
  description = "The information of the data disk labels"
}

variable "snapshot_policy_name" {
  description = "The snapshot policy name"
}

variable "machine_zone" {
  description = "The machine zone"
}

variable "kms_key_self_link" {
  description = "Key Management service key resource path."
  default     = ""
}

variable "data_disk_selflink" {
  type        = list(any)
  description = "Key Management service key resources path"
  default     = []
}


variable "data_disk_name" {
  type        = list(any)
  description = "Key Management service key resources path"
  default     = []
}

variable "attach_existing_disk" {
  description = ""
  type        = bool
  default     = false
}

variable "data_disk_with_snapshot" {
  description = ""
  type        = bool
  default     = false
}

variable "vim_with_data_disk" {
  description = ""
  type        = bool
  default     = false
}


