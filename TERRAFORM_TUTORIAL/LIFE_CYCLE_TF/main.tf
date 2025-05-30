terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.2"
    }
  }
}

resource "local_file" "life_cycle_1" {
    filename = "/home/dopadm/lifeCycle.txt"
    content  = "I Love DevOps"
    file_permission = "0700"

    lifecycle {
        prevent_destroy = true
 }    
}

resource "local_file" "life_cycle_2" {
    filename = "/home/dopadm/lifeCycle.txt"
    content  = "I Love DevOps"
    file_permission = "0700"
    
    lifecycle {
        create_before_destroy = true
    }
}


resource "local_file" "life_cycle_3" {
    filename = "/home/dopadm/lifeCycle.txt"
    content  = "I Love DevOps"
    file_permission = "0700"
    
    
    lifecycle {
    ignore_changes = [
        content
    ]
  }
   
}