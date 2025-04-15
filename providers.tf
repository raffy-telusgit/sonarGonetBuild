terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
  backend "gcs" {
    bucket = "sonar-gonet-lab-env-lab-tfstate"
  }
}

provider "google" {
  project = "sonar-gonet-lab-env-lab-0308cf"
  region  = var.region
  zone    = var.zone
}