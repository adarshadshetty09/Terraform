project_id = "spheric-mesh-465208-h9"

## bucket-01 ##
bucket_name = "ybatarball"
location = "asia-south1"
# region = "asia-south1"
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
  role_01 = {
    role = "roles/storage.objectViewer"
    member = [
      "serviceAccount:packer@spheric-mesh-465208-h9.iam.gserviceaccount.com"
    ]
  },
  role_02 = {
    role = "roles/storage.objectCreator"
    member = [
        "serviceAccount:packer@spheric-mesh-465208-h9.iam.gserviceaccount.com"
    ]
  },
  role_03 = {
    role = "roles/storage.legacyBucketReader"
    member = [
        "serviceAccount:packer@spheric-mesh-465208-h9.iam.gserviceaccount.com"
    ]
  },
    role_03 = {
    role = "roles/storage.legacyBucketWriter"
    member = [
        "serviceAccount:packer@spheric-mesh-465208-h9.iam.gserviceaccount.com"
    ]
  }
}