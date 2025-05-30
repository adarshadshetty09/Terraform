# output "team_member_info" {
#   value = [
#     for i in range(length(var.object_Variable.name)) : {
#       name   = var.object_Variable.name[i]
#       age    = var.object_Variable.age[i]
#       gender = lookup(var.object_Variable.gender, var.object_Variable.name[i], "Unknown")
#       role   = lookup(var.object_Variable.role, var.object_Variable.name[i], "Unknown Role")
#     }
#   ]
# }

output "team_member_names" {
  value = var.object_Variable.name
}

output "team_member_ages" {
  value = var.object_Variable.age
}

output "team_member_genders" {
  value = var.object_Variable.gender
}

output "team_member_roles" {
  value = var.object_Variable.role
}
