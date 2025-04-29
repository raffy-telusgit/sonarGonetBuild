terraform {
  backend "gcs" {
    bucket = "sonar-gonet-lab-env-lab-tfstate"
    prefix = "terraform/state"
  }
}