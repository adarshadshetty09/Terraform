variable "bucket_name" {
  description = "The name of the bucket."
  type        = string
}

variable "project_id" {
  description = "The ID of the project to create the bucket in."
  type        = string
}

variable "location" {
  description = "The location of the bucket."
  type        = string
}

variable "public_access_prevention" {
  description = "Prevents public access to a bucket."
  type        = string
  default     = "enforced"
}

variable "storage_class" {
  description = "The Storage class of the new bucket."
  type        = string
  default     = "STANDARD"
}

variable "bucket_labels" {
  description = "A set of key/value label pair to assign to the bucket."
  type        = map(string)
  default     = {}
}

variable "uniform_bucket_level_access" {
  description = "Enables uniform bucket level access to bucket."
  type        = bool
  default     = true
}

variable "versioning" {
  description = "Enable object versioning."
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "Delete all objects when destroying bucket."
  type        = bool
  default     = false
}

variable "retention_policy" {
  description = "Retention policy configuration."
  type = object({
    is_locked        = bool
    retention_period = number
  })
  default = null
}

variable "bucket_encryption" {
  description = "Encryption config with KMS key."
  type = object({
    default_kms_key_name = string
  })
  default = null
}

variable "set_roles" {
  description = "Whether to assign IAM roles."
  type        = bool
  default     = false
}

variable "iam_members" {
  description = "IAM members and roles map."
  type = map(object({
    role   = string
    member = list(string)
  }))
  default = {}
}

variable "custom_placement_config" {
  description = "Custom dual-region bucket config."
  type = object({
    data_locations = list(string)
  })
  default = null
}
