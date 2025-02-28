resource "aws_s3_bucket" "cdnTest" {
  bucket = var.aws_bucket_name

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.cdnTest.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_versioning" "CDNVersionining" {
  bucket = aws_s3_bucket.cdnTest.id
  versioning_configuration {
    status = "Enabled"
  }
}

locals {
  file_to_upload = {
    "index.html" = "./staticPage/index.html"
    "error.html" = "./staticPage/error.html"
  }
}

resource "aws_s3_object" "static_files" {
  for_each = local.file_to_upload
  bucket = var.aws_bucket_name
  key = each.key
  source = each.value
}


# resource "aws_s3_object" "indexHTML" {
#   bucket = "adarshadshettystaticcdnwebsitehosting280220251143"
#   key    = "index.html"  # You can set the object key as needed
#   source = "./staticPage/index.html"  # Correct relative path to your index.html file
# }

# resource "aws_s3_object" "errorHTML" {
#   bucket = "adarshadshettystaticcdnwebsitehosting280220251143"
#   key    = "error.html"  # You can set the object key as needed
#   source = "./staticPage/error.html"  # Correct relative path to your index.html file
# }


# resource "aws_s3_bucket_acl" "cdnACL" {
#   bucket = var.aws_bucket_name
#   acl = var.aws_acl_config
# }

# Static website hosting "enabling"
resource "aws_s3_bucket_website_configuration" "enableStaticWebsiteHosting" {
  bucket = aws_s3_bucket.cdnTest.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "index.html"
    }
    redirect {
      replace_key_prefix_with = "index.html"
    }
  }
}
