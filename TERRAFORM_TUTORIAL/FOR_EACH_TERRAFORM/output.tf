# output "pet_output" {
#   value = [for pet in local_file.pet : pet.filename]
# }

# output "pet1_output" {
#   value = [for pet1 in local_file.pet1 : pet1.filename]
# }

output "pets"{
    value = local_file.pet
    sensitive = true
}