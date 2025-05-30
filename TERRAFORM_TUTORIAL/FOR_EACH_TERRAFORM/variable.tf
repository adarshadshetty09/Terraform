variable "filename" {
  type = set(string)
  default = [
    "pets.txt",
    "dogs.txt",
    "cats.txt"
  ]
}

variable "filename1" {
  type = list(string)
  default = [
    "pets1.txt",
    "dogs1.txt",
    "cats1.txt"
  ]
}
