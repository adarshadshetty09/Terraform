resource "local_file" "pet" {
  content  = var.content[count.index]
  filename = var.filename[count.index]
  count    = length(var.filename)
}
 
variable "filename" {
  type    = list(string)
  default = ["file1.txt", "file2.txt", "file3.txt"]
}
 
variable "content" {
  type    = list(string)
  default = ["Hello, World!", "Hello, World! hi", "Hello, World! hiiii"]
}