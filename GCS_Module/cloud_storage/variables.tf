variable "name" {
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
  description = "Prevents public access to a bucket. Acceptable values are inherited or enforced. If inherited, the bucket uses public access prevention, only if the bucket is subject to the public access prevention organization policy constraints."
  type        = string
  default     = "enforced"
}

variable "storage_class" {
  description = "The Storage class of the new bucket."
  type        = string
  default     = "null"
}

variable "labels" {
  description = "A set of key/value label pair to assign to the bucket."
  type        = map(string)
  default     = null
}

variable "uniform_bucket_level_access" {
  description = "Enables uniform bucket level access to bucket."
  type        = bool
  default     = true
}

variable "versioning" {
  description = "while set to true , versioning is fully enabled for this bucket."
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "when deleting a bucket, this boolean option will delete all contained objects, If false , Terraform will fail to delete bucket which contain object."
  type        = bool
  default     = false
}

variable "retention_policy" {
  description = "Configuration of the bucket's data retention policy for how long objects in the bucket should be retained."
  type = object({
    is_locked        = bool
    retention_period = number
  })
  default = null
}

variable "encryption" {
  description = "A Cloud KMS key that will be used to encrypt object inserted into this bucket."
  type = object({
    default_kms_key_name = string
  })
  default = null
}

variable "set_roles" {
  type = bool
}

# variable "iam_members" {
#   description = "The list of IAM members to grant permission on the bucket."
#   default     = {}
# }



variable "iam_members" {
  type = map(object({
    role   = string
    member = list(string)
  }))
  default = {}
}


variable "custom_placement_config" {
  description = "Configuration of the bucket's custom location in the dual-region bucket setup. If the bucket is designated a single or multi-region, the variable is null."
  type = object({
    data_locations = list(string)
  })
  default = null
}
