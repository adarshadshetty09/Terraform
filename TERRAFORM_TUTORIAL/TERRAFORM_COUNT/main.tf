terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.2"
    }
  }
}

resource "local_file" "countPractice" {
  count    = length(var.filename)
  filename = var.filename[count.index]  
  content  = "This is the content of ${var.filename[count.index]}"  
}


