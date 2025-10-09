# ~/Terraform/compute_engine_yugabyte/modules/oslogin/main.tf (Corrected)

resource "google_compute_project_metadata" "default" {
  metadata = {
    # Convert the boolean variable (var.enable_oslogin) to the required string ("TRUE" or "FALSE")
    enable-oslogin = var.enable_oslogin  
  }
}