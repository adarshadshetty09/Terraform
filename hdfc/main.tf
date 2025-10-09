# ~/Terraform/compute_engine_yugabyte/main.tf (Corrected)

module "os_login_policy" {
  # Use a relative path, which is more portable
  source = "./modules/compute_engine/oslogin"

  # Use underscore naming convention for the variable
  # The value is correctly passed as a boolean (true)
  enable_oslogin = true
}


# resource "google_project_service" "essential_apis" {
#   for_each = toset([
#     "compute.googleapis.com",
#     "iam.googleapis.com",
#     "oslogin.googleapis.com"
#   ])

#   project            = var.project_id
#   service            = each.key
#   disable_on_destroy = false
# }






