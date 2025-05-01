variable "project_id" {
  type        = string
  description = "The ID of the project where resources will be created"
}

variable "db_server_name" {
  type        = string
  description = "The name of the Cloud SQL server"
}
variable "instance_tier" {
  type = string
  description = "The instance tier of the db (using db-custom-* for older PostgreSQL versions)"
  default = "db-custom-2-7680"
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
  default     = "REGIONAL"
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
  default     = {}
}

variable "query_insights_enabled" {
  type        = bool
  description = "Whether query insights are enabled"
  default     = false
}

variable "query_string_length" {
  type        = string
  description = "The length of the query string for query insights"
  default     = "1024"
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

variable "network" {
  type        = string
  description = "The VPC network self-link to which the Cloud SQL instance should be connected"
}

variable "vpc_connection" {
  type        = any
  description = "The VPC peering connection to depend on"
}
