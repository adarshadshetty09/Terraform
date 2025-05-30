# terraform {
#   required_providers {
#     local = {
#       source = "hashicorp/local"
#       version = "2.5.2"
#     }
#   }
# }

# resource "local_file" "pet" {
#   for_each = var.filename
#   filename = each.value
#   content  = "This is a pet file for ${each.value}"  
# }



# resource "local_file" "pet1" {
#   for_each = toset(var.filename1)
#   filename = each.value
#   content  = "This is a pet file for ${each.value}"  
# }


# output "pet_output"{
#     value = local_file.pet
# }

# output "pet1_output"{
#     value = local_file.pet1
# }


# variable "filename" {
#   type = set(string)
#   default = [
#     "/home/dopadm/pets.txt",
#     "/home/dopadm/dogs.txt",
#     "/home/dopadm/cats.txt"
#   ]
# }


# variable "filename1" {
#   type = list(string)
#   default = [
#     "/home/dopadm/pets1.txt",
#     "/home/dopadm/dogs1.txt",
#     "/home/dopadm/cats1.txt"
#   ]
# }


terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.2"
    }
  }
}

resource "local_file" "pet" {
  for_each = var.filename
  filename = each.value
  content  = "This is a pet file for ${each.value}"  
}

resource "local_file" "pet1" {
  for_each = toset(var.filename1)
  filename = each.value
  content  = "This is a pet file for ${each.value}"  
}



