project_id = "spheric-mesh-465208-h9"
bucket_name = "ybatarball"
location = "asia-south1"
bucket_encryption = ({
    default_kms_key_name = ""
})

bucket_labels = {
  environment       = "dev"
  team              = "data-engineering"
  project           = "customer-analytics"
  cost_center       = "cc-8492"
  owner             = "adarsha-d-shetty"
  department        = "finance"
  app               = "billing-service"
  region            = "us-central1"
  managed_by        = "terraform"
  data_class        = "confidential"
  lifecycle_stage   = "experimental"
  platform          = "gcp"
  created_by        = "iac"
  compliance        = "gdpr"
  priority          = "high"
}

set_roles = true

iam_members = {
    role1 = {
        role = "roles/storage.objectViewer"
        member = [
            "add the service account"
        ]
    },
    role2 = {
        role = "roles/storage.objectViewer"
        member = [
            "add the service account"
        ]
    },
}