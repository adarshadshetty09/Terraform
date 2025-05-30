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
    description = "Finance Data"
  }
}

resource "aws_s3_bucket_object" "finanace_2024" {
  content = "/home/dopadm/pythonBook/validPalindrom.py"
  key = "validPalindrom.py"
  bucket = aws_s3_bucket.s3_bucket.id
}


resource "aws_s3_bucket_object" "object" {
  bucket = "adarshadshettybucket22022025"
  key    = "index.py"
  source = "/home/dopadm/pythonBook/validPalindrom.py" 
}