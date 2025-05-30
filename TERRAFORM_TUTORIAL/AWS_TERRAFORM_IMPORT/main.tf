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
  access_key = "AKIASBGQLRFERNVTNGA7"  
  secret_key = "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"  
}


resource "aws_instance" "webserver-2" {
    instance_type                        = "t2.micro"
    ami                                  = "ami-00bb6a80f01f03502"
}