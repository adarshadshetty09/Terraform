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

resource "aws_iam_user" "demo_1" {
  name = "Adarsha_Demo_1"
  path = "/"

  tags = {
    Description = "Technical Team Leader"
  }
}

resource "aws_iam_policy" "adminPolicy" {
  name        = "adminPolicy"
  path        = "/"
  description = "My test policy"
  policy = file("admin_policy.json")
}

resource "aws_iam_user_policy_attachment" "iamPolicyAttach" {
  user       = aws_iam_user.demo_1.name    # Attach policy to the IAM user, not policy
  policy_arn = aws_iam_policy.adminPolicy.arn
}
