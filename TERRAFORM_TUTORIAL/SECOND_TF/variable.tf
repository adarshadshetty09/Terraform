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
