terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.2"
    }
  }
}

# resource "local_file" "countArgument" {
#   filename = "${var.count_Argument}-${count.index}" 
#   count    = 3
#   content  = "This is a sample content for file ${count.index}" 
# }

# resource "local_file" "countArgument" {
#   filename = "${var.count_Argument}-${count.index}" 
#   count    = 3
#   content  = "This is a sample content for file ${count.index}" 
# }



# Use length Function
resource "local_file" "textFile" {
  count    = length(var.filename)
  filename = var.filename[count.index]
  content  = "This is the content for file ${count.index}"  # Add content to be written in the file
}