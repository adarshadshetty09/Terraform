resource "aws_instance" "example" {
  ami           = "ami-0e35ddab05955cf57" # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"

  tags = {
    Name = "Vault-Terraform-EC2"
  }
}
