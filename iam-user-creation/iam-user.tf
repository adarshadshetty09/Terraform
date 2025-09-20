data "aws_caller_identity" "current" {}

resource "aws_iam_user" "test" {
  name = "test"
  path = "/system/"

  tags = {
    tag-key = "test"
  }
}

resource "aws_iam_access_key" "test" {
  user = aws_iam_user.test.name
}


resource "aws_iam_user_login_profile" "test" {
  user = aws_iam_user.test.name
  #   pgp_key = file("public.gpg")
  password_reset_required = true
}

output "access_key_id" {
  value       = aws_iam_access_key.test.id
  description = "The AWS Access Key ID"
}

output "secret_access_key" {
  value       = aws_iam_access_key.test.secret
  description = "The AWS Secret Access Key"
  sensitive   = true
}

output "password" {
  value     = aws_iam_user_login_profile.test.password
  sensitive = true
}


output "console_login_url" {
  description = "URL to sign in to the AWS Management Console"
  value       = "https://${data.aws_caller_identity.current.account_id}.signin.aws.amazon.com/console"
}


# Outputs:
# terraform out outputresourcename