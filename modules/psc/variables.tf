variable "project_id" {
  description = "The project ID where the PSC resources will be created"
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "network_id" {
  description = "The ID of the VPC network where PSC will be created"
  type        = string
}

variable "psc_address" {
  description = "The IP address for the Private Service Connect endpoint"
  type        = string
}
