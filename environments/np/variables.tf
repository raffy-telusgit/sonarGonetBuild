variable "project_id" {
  description = "The ID of the project where resources will be created"
  type        = string
  default     = "sonar-gonet-lab-env-lab-0308cf"
}

variable "region" {
  description = "The region to deploy resources to"
  type        = string
  default     = "northamerica-northeast1"
}

variable "zone" {
  description = "The zone to deploy resources to"
  type        = string
  default     = "northamerica-northeast1-a"
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

# Cloud SQL variables
variable "db_server_name" {
  type        = string
  description = "The name of the Cloud SQL server"
}

variable "db_name" {
  type        = string
  description = "The name of the database"
}

variable "db_version" {
  type        = string
  description = "The version of the database"
}

variable "availability_type" {
  type        = string
  description = "The availability type for the Cloud SQL instance"
}

variable "backup_start_time" {
  type        = string
  description = "The start time for the daily backup"
}

variable "backup_location" {
  type        = string
  description = "The location where the backups will be stored"
}

variable "maintenance_window_hour" {
  type        = string
  description = "The hour of the maintenance window"
}

variable "maintenance_window_day" {
  type        = string
  description = "The day of the maintenance window"
}

variable "database_flags" {
  type        = map(string)
  description = "Database flags for the Cloud SQL instance"
}

variable "query_insights_enabled" {
  type        = bool
  description = "Whether query insights are enabled"
}

variable "query_string_length" {
  type        = string
  description = "The length of the query string for query insights"
}

variable "deletion_protection" {
  type        = bool
  description = "Whether or not to allow Terraform to destroy the instance"
  default     = true
}

variable "psc_config" {
  type = object({
    enabled                   = bool
    allowed_consumer_projects = list(string)
  })
  description = "Private Service Connect configuration"
}
