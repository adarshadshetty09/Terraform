variable "prefix" {
  type        = list(string)
  description = "Prefix for gender"
}

variable "name" {
  type        = list(string)
  description = "Names of the DevOps team"
}

variable "age" {
  type        = list(number)
  description = "Ages of team members"
}

variable "gender" {
  type = map(string)
  description = "Gender of team members"
}

variable "role" {
  type = map(string)
  description = "Roles of team members"
}
