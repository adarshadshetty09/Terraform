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

variable "object_Variable" {
  type = object({
    prefix = list(string)
    name   = list(string)
    age    = list(number)
    gender = map(string)
    role   = map(string)
  })

  default = {
    prefix = ["MRs", "MR"]
    name   = ["Adarshaa", "Ananda", "Gagana", "Navya", "Jerlin"]
    age    = [35, 32, 24, 25, 30]
    gender = {
      Adarshaa = "Male"
      Ananda   = "Male"
      Gagana   = "Female"
      Navya    = "Female"
      Jerlin   = "Male"
    }
    role = {
      Adarshaa = "Principle Engineer"
      Anand    = "Tester"
      Gagana   = "DevOps Engineer"
      Navya    = "Operations"
      Jerlin   = "Database Engineer"
    }
  }
}

resource "local_file" "team_member_updated" {
  count    = length(var.object_Variable.name)

  filename = "/home/dopadm/${var.object_Variable.prefix[0]}_${var.object_Variable.name[count.index]}.txt"
  content  = "Name: ${var.object_Variable.name[count.index]} || Age: ${var.object_Variable.age[count.index]} || Gender: ${var.object_Variable.name[count.index] == "Adarshaa" ? lookup(var.env_variables, "MY_ADARSHAA_GENDER", "") : lookup(var.object_Variable.gender, var.object_Variable.name[count.index], "Unknown")} || Role: ${var.object_Variable.name[count.index] == "Adarshaa" ? lookup(var.env_variables, "MY_ADARSHAA_ROLE", "") : lookup(var.object_Variable.role, var.object_Variable.name[count.index], "Unknown Role")}"

  file_permission = "0700"
}

variable "env_variables" {
  type = map(string)
  default = {
    MY_ADARSHAA_GENDER = "Male"
    MY_ADARSHAA_ROLE   = "Principle Engineer"
  }
}
