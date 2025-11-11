# output "yba_control_node_disks" {
#   value = {
#     boot_disk  = module.yugabyte-cluster["yba-control-node"].google_compute_disk.boot_gce_disk[*].name
#     data_disks = {
#       yugabyte = module.yugabyte-cluster["yba-control-node"].google_compute_disk.yugabyte[*].name
#     }
#     attached_disks = {
#       yugabyte = module.yugabyte-cluster["yba-control-node"].google_compute_attached_disk.yugabyte_attach[*].device_name
#     }
#   }
# }

# output "yba_db_node_disks" {
#   value = {
#     boot_disk  = module.yugabyte-cluster["yba-db-node"].google_compute_disk.boot_gce_disk[*].name
#     data_disks = {
#       data1  = module.yugabyte-cluster["yba-db-node"].google_compute_disk.data1[*].name
#       shared = module.yugabyte-cluster["yba-db-node"].google_compute_disk.shared[*].name
#       wal1   = module.yugabyte-cluster["yba-db-node"].google_compute_disk.wal1[*].name
#     }
#     attached_disks = {
#       data1  = module.yugabyte-cluster["yba-db-node"].google_compute_attached_disk.data1_attach[*].device_name
#       shared = module.yugabyte-cluster["yba-db-node"].google_compute_attached_disk.shared_attach[*].device_name
#       wal1   = module.yugabyte-cluster["yba-db-node"].google_compute_attached_disk.wal1_attach[*].device_name
#     }
#   }
# }
