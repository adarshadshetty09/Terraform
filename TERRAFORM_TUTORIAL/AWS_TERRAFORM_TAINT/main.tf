terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "web" {
  public_key = file("test.pub")
}

resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "Allow SSH and HTTP access from the internet"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "webserver" {
  ami                    = "ami-00bb6a80f01f03502" # Ensure this is valid in the ap-south-1 region
  instance_type           = "t2.micro"
  tags = {
    Name        = "WebServer"
    Description = "An Nginx WebServer on Ubuntu"
  }

  key_name               = aws_key_pair.web.id
  vpc_security_group_ids = [aws_security_group.ssh-access.id]
}

resource "aws_instance" "webserver-1" {
  ami                    = "ami-00bb6a80f01f03502" # Ensure this is valid in the ap-south-1 region
  instance_type           = "t2.micro"
  tags = {
    Name        = "WebServer-1"
    Description = "An Nginx WebServer on Ubuntu"
  }

  key_name               = aws_key_pair.web.id
  vpc_security_group_ids = [aws_security_group.ssh-access.id]
}

output "publicIP-webserver" {
  value = aws_instance.webserver.public_ip
}

output "publicIP-webserver-1" {
  value = aws_instance.webserver-1.public_ip
}
