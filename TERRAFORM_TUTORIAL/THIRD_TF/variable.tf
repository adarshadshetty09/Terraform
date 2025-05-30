variable "tuple_list" {
  type = list(object({
    prefix = string
    name   = string
    age    = number
    gender = string
    role   = string
  }))

  default = [
    {
      prefix = "MRs"
      name   = "Adarshaa"
      age    = 35
      gender = "Male"
      role   = "Principle Engineer"
    },
    {
      prefix = "MRs"
      name   = "Ananda"
      age    = 32
      gender = "Male"
      role   = "Tester"
    },
    {
      prefix = "MRs"
      name   = "Gagana"
      age    = 24
      gender = "Female"
      role   = "DevOps Engineer"
    },
    {
      prefix = "MRs"
      name   = "Navya"
      age    = 25
      gender = "Female"
      role   = "Operations"
    },
    {
      prefix = "MRs"
      name   = "Jerlin"
      age    = 30
      gender = "Male"
      role   = "Database Engineer"
    }
  ]
}
