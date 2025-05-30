terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIASBGQLRFERNVTNGA7"  
  secret_key = "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"  
}

resource "local_file" "pet" {
  filename = "index.txt"
  content = "We Love Pets"
}

resource "local_file" "pet1" {
  filename = "index1.txt"
  content = "We Love Pets"
}

resource "local_file" "pet2" {
  filename = "index2.txt"
  content = "We Love Pets"
}


