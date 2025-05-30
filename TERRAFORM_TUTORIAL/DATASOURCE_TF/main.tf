terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.5.2"
    }
  }
}


data "local_file" "localDataSource" {
  filename = "/home/dopadm/index.html"
}


resource "local_file" "dataSourceTest" {
  filename = "/home/dopadm/index1.html"
  content  = data.local_file.localDataSource.content
}
