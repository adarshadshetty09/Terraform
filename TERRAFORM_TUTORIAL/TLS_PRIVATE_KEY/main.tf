terraform {
  required_providers {    
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.0"
    }
  }
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 2048  # Added missing rsa_bits
}

output "private_key" {
  value     = tls_private_key.rsa.private_key_pem
  sensitive = true
}

 