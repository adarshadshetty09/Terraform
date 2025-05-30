variable "prefix" {
  type        = list(string)
  default     = ["MRs", "MR"]
  description = "Prefix for gender"
}

variable "name" {
  type        = list(string)
  default     = ["Adarshaa", "Ananda", "Gagana", "Navya", "Jerlin"]
  description = "Names of the DevOps team"
}

variable "age" {
  type        = list(number)
  default     = [35, 32, 24, 25, 30]
  description = "Ages of team members"
}

# Gender defined as a map instead of list
variable "gender" {
  type = map(string)
  default = {
    Adarshaa = "Male"
    Ananda   = "Male"
    Gagana   = "Female"
    Navya    = "Female"
    Jerlin   = "Male"
  }
}

variable "role" {
  type = map(string)
  default = {
    Adarshaa = "Principle Engineer"
    Anand    = "Tester"
    Gagana   = "DevOps Engineer"
    Navya    = "Operations"
    Jerlin   = "Database Engineer"
  }
}

