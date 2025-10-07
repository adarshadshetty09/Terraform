output "self_link" {
  value = google_compute_resource_policy.snapshot_policy.self_link
  description = "Policy Self Link"
}

output "policy_name" {
  value = var.policy_name
  description = "Policy Self Link"
}