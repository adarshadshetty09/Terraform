########################################
# Snapshot Policy Creation
########################################

resource "google_compute_resource_policy" "snapshot_policy" {
  name = var.policy_name
  snapshot_schedule_policy {
    schedule {
      hourly_schedule {
        hours_in_cycle = 23
        start_time = var.utc_time
    }
  }
  retention_policy {
    max_retention_days = var.retention_days
    on_source_disk_delete = "KEEP_AUTO_SNAPSHOTS"
  }
  snapshot_properties {
    storage_locations = [var.storage_location]
  }
}
}