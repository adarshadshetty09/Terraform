terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = var.aws_region
  # access_key = var.aws_access_key  # Correct this line to use the access key variable
  # secret_key = var.aws_secret_key  # Correct this line to use the secret key variable
}


