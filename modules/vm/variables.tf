variable "instance_name" {
  description = "The name of the VM instance"
  type        = string
}

variable "machine_type" {
  description = "The machine type to use for the VM instance"
  type        = string
  default     = "e2-medium"
}

variable "zone" {
  description = "The zone where the VM instance will be created"
  type        = string
}

variable "image" {
  description = "The boot disk image to use for the VM instance"
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "tags" {
  description = "Network tags to apply to the VM instance"
  type        = list(string)
  default     = []
}

variable "subnetwork" {
  description = "The subnetwork to attach the VM instance to"
  type        = string
}

variable "project_id" {
  description = "The ID of the project where resources will be created"
  type        = string
}
