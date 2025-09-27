variable "credentials_file" {}
variable "project" {}
variable "region" {
  default = "us-central1"
}
variable "zone" {
  default = "us-central1-a"
}
variable "instance_name" {
  default = "terraform-instance"
}
variable "machine_type" {
  default = "e2-medium"
}
variable "source_image" {
  default = "debian-cloud/debian-12"
}
variable "public_ssh_key_path" {}

variable "disk_size" {
  default = 10
}