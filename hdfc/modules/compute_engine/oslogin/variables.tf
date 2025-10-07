# ~/Terraform/compute_engine_yugabyte/modules/oslogin/variables.tf (Corrected)

variable "enable_oslogin" { # Changed to underscore and type added
  description = "Set to true to enable OS Login for the GCP project metadata."
  type        = bool
  default     = true
}