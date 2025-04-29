variable "project_id" {
  description = "The ID of the project where resources will be created"
  type        = string
  default     = "sonar-gonet-lab-env-lab-0308cf"
}

variable "region" {
  description = "The region to deploy resources to"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The zone to deploy resources to"
  type        = string
  default     = "us-central1-a"
}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
  default     = "np-vpc"
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "np-subnet"
}

variable "subnet_cidr" {
  description = "The CIDR range for the subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "vm_instance_name" {
  description = "The name of the VM instance"
  type        = string
  default     = "np-vm"
}

variable "vm_machine_type" {
  description = "The machine type to use for the VM instance"
  type        = string
  default     = "e2-medium"
}

variable "project_terraform_state_gcs_bucket_name" {
  type        = string
  description = "The name of the Google Cloud Storage bucket that holds the Terraform state file"
}
