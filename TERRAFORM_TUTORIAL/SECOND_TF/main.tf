terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0.0"
    }
    
  }
}

resource "local_file" "team_member" {
  count    = length(var.object_Variable.name)

  filename = "/home/dopadm/${var.object_Variable.prefix[0]}_${var.object_Variable.name[count.index]}.txt"
  content  = "Name: ${var.object_Variable.name[count.index]} || Age: ${var.object_Variable.age[count.index]} || Gender: ${lookup(var.object_Variable.gender, var.object_Variable.name[count.index], "Unknown")} || Role: ${lookup(var.object_Variable.role, var.object_Variable.name[count.index], "Unknown Role")}"

  file_permission = "0700"
}

