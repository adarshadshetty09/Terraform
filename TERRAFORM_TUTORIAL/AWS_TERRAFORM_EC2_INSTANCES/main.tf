terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  secret_key = "zEBbYCoS2VbrXsw4xe2o4nRe4SnXw8AfcpYcVe7a"
  access_key = "AKIASBGQLRFEX7N6F5E4"
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
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "webserver" {
  ami                    = "ami-0385f6d2820fab076" # Ensure this is valid in the ap-south-1 region
  instance_type           = "t3.2xlarge"
  tags = {
    Name        = "WebServer"
    Description = "An Nginx WebServer on Ubuntu"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo apt install -y nginx
              sudo systemctl start nginx
  EOF

  key_name               = aws_key_pair.web.id
  vpc_security_group_ids = [aws_security_group.ssh-access.id]
}

# Get the availability zone of the EC2 instance dynamically
data "aws_availability_zones" "available" {}

# Create an EBS volume of 300GB in the same availability zone as the instance
resource "aws_ebs_volume" "web_volume" {
  availability_zone = data.aws_availability_zones.available.names[0]  # Use the first AZ in the region
  size              = 300
  tags = {
    Name = "WebServerVolume"
  }
}

# Attach the EBS volume to the EC2 instance
resource "aws_volume_attachment" "webserver_volume_attachment" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.web_volume.id
  instance_id = aws_instance.webserver.id
}

output "publicIP" {
  value = aws_instance.webserver.public_ip
}
