provider "vault" {
  address = "http://3.110.44.105/:8200"
  token = "hvs.XQ5c5of6yBAbEMko5snxZ4Xj" # Ensure this is the correct root token for this session
}


data "vault_kv_secret_v2" "aws_creds" {
  mount   = "aws"
  name    = "creds/my-aws-credentials"
}

provider "aws" {
  access_key = data.vault_kv_secret_v2.aws_creds.data.access_key
  secret_key = data.vault_kv_secret_v2.aws_creds.data.secret_key
  region    = "ap-south-1"
}