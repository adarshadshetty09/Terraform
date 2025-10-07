# ~/Terraform/compute_engine_yugabyte/main.tf (Corrected)

module "os_login_policy" {
  # Use a relative path, which is more portable
  source = "./modules/compute_engine/oslogin" 
  
  # Use underscore naming convention for the variable
  # The value is correctly passed as a boolean (true)
  enable_oslogin = true 
}