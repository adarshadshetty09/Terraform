terraform {
  backend "s3" {
    bucket = "adarshadshettybucket22022025"
    key = "remoteState/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-state-lock"
  }
}
