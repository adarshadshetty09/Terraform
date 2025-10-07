terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "7.5.0"
    }
  }
}

provider "google" {
    project = "nifty-saga-472603-b3"
    region      = "us-central1"
}