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

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "adarshadshettybucket22022025"

  tags = {
    description = "remote_state_backend"
  }
}

resource "aws_dynamodb_table" "terraform_state_lock_table" {
  name           = "terraform-state-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}


resource "aws_dynamodb_table" "terraform_state_lock_table_db" {
  name           = "terraform-state-lock-db"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

