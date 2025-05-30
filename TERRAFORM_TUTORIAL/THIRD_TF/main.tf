terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0.0"
    }
  }
}

resource "local_file" "team_member" {
  count    = length(var.tuple_list)  # Iterate over tuple_list instead of object_Variable

  filename = "/home/dopadm/${var.tuple_list[count.index].prefix}_${var.tuple_list[count.index].name}.txt"
  content  = "Name: ${var.tuple_list[count.index].name} || Age: ${var.tuple_list[count.index].age} || Gender: ${var.tuple_list[count.index].gender} || Role: ${var.tuple_list[count.index].role}"

  file_permission = "0700"
}

