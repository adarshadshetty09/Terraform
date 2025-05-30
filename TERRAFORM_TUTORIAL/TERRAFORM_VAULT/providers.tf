provider "vault" {
  address = "http://localhost:8200"
  token   = "hvs.TJcP9EHaqJedbu0rZtqNsgxV"
}

data "vault_kv_secret_v2" "aws_creds" {
  mount = "secret" # Ensure this is the correct mount path for your Vault KV
  name  = "aws-credentials" # Ensure this matches the actual secret name stored in Vault
}

provider "aws" {
  access_key = data.vault_kv_secret_v2.aws_creds.data["access_key"]
  secret_key = data.vault_kv_secret_v2.aws_creds.data["secret_key"]
  region     = "ap-south-1"
}
