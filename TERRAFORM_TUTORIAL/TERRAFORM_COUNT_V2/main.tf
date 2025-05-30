terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.3.0"
    }
  }
}
resource "local_file" "anand" {
    count=length(var.name)
    filename = "${var.name[count.index]}.txt"
    content = "names{${var.name[count.index]}}"
 
}

variable "name" {
  default = ["anand", "adarash", "gagana"]
  type    = list(string)
}