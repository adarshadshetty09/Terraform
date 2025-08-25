project_id = "spheric-mesh-465208-h9"

buckets = {
  ybatarball = {
    location = "asia-south1"

    bucket_encryption = {
      default_kms_key_name = "" # Leave empty or provide actual KMS key if available
    }

    bucket_labels = {
      environment     = "dev"
      team            = "data-engineering"
      project         = "customer-analytics"
      cost_center     = "cc-8492"
      owner           = "adarsha-d-shetty"
      department      = "finance"
      app             = "billing-service"
      region          = "us-central1"
      managed_by      = "terraform"
      data_class      = "confidential"
      lifecycle_stage = "experimental"
      platform        = "gcp"
      created_by      = "iac"
      compliance      = "gdpr"
      priority        = "high"
    }

    set_roles = true

    iam_members = {
      role1 = {
        role = "roles/storage.objectViewer"
        member = [
          "serviceAccount:example-sa1@spheric-mesh-465208-h9.iam.gserviceaccount.com"
        ]
      }
      role2 = {
        role = "roles/storage.objectAdmin"
        member = [
          "serviceAccount:example-sa2@spheric-mesh-465208-h9.iam.gserviceaccount.com"
        ]
      }
    }

    retention_policy = {
      is_locked        = false
      retention_period = 86400 # 1 day
    }

    custom_placement_config = null
  }

  ybatarballtar = {
    location = "asia-south1"

    bucket_encryption = {
      default_kms_key_name = ""
    }

    bucket_labels = {
      environment     = "dev"
      team            = "data-engineering"
      project         = "customer-analytics"
      cost_center     = "cc-8492"
      owner           = "adarsha-d-shetty"
      department      = "finance"
      app             = "billing-service"
      region          = "us-central1"
      managed_by      = "terraform"
      data_class      = "confidential"
      lifecycle_stage = "experimental"
      platform        = "gcp"
      created_by      = "iac"
      compliance      = "gdpr"
      priority        = "high"
    }

    set_roles = true

    iam_members = {
      role1 = {
        role = "roles/storage.objectViewer"
        member = [
          "serviceAccount:example-sa1@spheric-mesh-465208-h9.iam.gserviceaccount.com"
        ]
      }
      role2 = {
        role = "roles/storage.admin"
        member = [
          "serviceAccount:example-sa2@spheric-mesh-465208-h9.iam.gserviceaccount.com"
        ]
      }
    }

    retention_policy = {
      is_locked        = false
      retention_period = 172800 # 2 days
    }

    custom_placement_config = null
  }
  ybatarballtar-extra = {
    location = "asia-south1"

    bucket_encryption = {
      default_kms_key_name = ""
    }

    bucket_labels = {
      environment     = "dev"
      team            = "data-engineering"
      project         = "customer-analytics"
      cost_center     = "cc-8492"
      owner           = "adarsha-d-shetty"
      department      = "finance"
      app             = "billing-service"
      region          = "us-central1"
      managed_by      = "terraform"
      data_class      = "confidential"
      lifecycle_stage = "experimental"
      platform        = "gcp"
      created_by      = "iac"
      compliance      = "gdpr"
      priority        = "high"
    }

    set_roles = true

    iam_members = {
      role1 = {
        role = "roles/storage.objectViewer"
        member = [
          "serviceAccount:example-sa1@spheric-mesh-465208-h9.iam.gserviceaccount.com"
        ]
      }
      role2 = {
        role = "roles/storage.admin"
        member = [
          "serviceAccount:example-sa2@spheric-mesh-465208-h9.iam.gserviceaccount.com"
        ]
      }
    }

    retention_policy = {
      is_locked        = false
      retention_period = 172800 # 2 days
    }

    custom_placement_config = null
  }
  ybatarballtar-extra-extra = {
    location = "asia-south1"

    bucket_encryption = {
      default_kms_key_name = ""
    }

    bucket_labels = {
      environment     = "dev"
      team            = "data-engineering"
      project         = "customer-analytics"
      cost_center     = "cc-8492"
      owner           = "adarsha-d-shetty"
      department      = "finance"
      app             = "billing-service"
      region          = "us-central1"
      managed_by      = "terraform"
      data_class      = "confidential"
      lifecycle_stage = "experimental"
      platform        = "gcp"
      created_by      = "iac"
      compliance      = "gdpr"
      priority        = "high"
    }

    set_roles = true

    iam_members = {
      role1 = {
        role = "roles/storage.objectViewer"
        member = [
          "serviceAccount:example-sa1@spheric-mesh-465208-h9.iam.gserviceaccount.com"
        ]
      }
      role2 = {
        role = "roles/storage.admin"
        member = [
          "serviceAccount:example-sa2@spheric-mesh-465208-h9.iam.gserviceaccount.com"
        ]
      }
    }

    retention_policy = {
      is_locked        = false
      retention_period = 172800 # 2 days
    }

    custom_placement_config = null
  }
}
