```
count = var.vim_with_data_disk == true && var.attach_existing_disk == false ? 1 : 0
```


count is used to conditionally create the disk:

Create 1 disk only if:

vim_with_data_disk is true, and

attach_existing_disk is false

Otherwise, create 0 disks (i.e., skip this resource)

```
📦 Disk Configuration
name  = var.data_disk_info["disk_name"]
size  = var.data_disk_info["disk_size_gb"]
type  = var.data_disk_info["disk_type"]
zone  = var.machine_zone
```

name: The name of the disk (e.g., "data-disk-01")

size: Size in GB

type: Disk type (pd-standard, pd-ssd, etc.)

zone: Zone where the disk is created (e.g., us-central1-a)



```
🏷️ Labels
labels = merge(
  var.disk_labels,
  tomap({
    "type" = "boot",
  })
)

```
Merges:

Any user-defined labels from var.disk_labels

A hardcoded label "type" = "boot" (this may be misleading for a data disk — might be a mislabeling)