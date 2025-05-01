module "vpc" {
  source = "../../modules/vpc"

  project_id   = var.project_id
  region       = var.region
  network_name = var.network_name
  subnet_name  = var.subnet_name
  subnet_cidr  = var.subnet_cidr
}

module "psc" {
  source = "../../modules/psc"

  project_id   = var.project_id
  network_name = var.network_name
  network_id   = module.vpc.network_id
  psc_address  = var.psc_address
}

module "vm" {
  source = "../../modules/vm"

  project_id    = var.project_id
  instance_name = var.vm_instance_name
  machine_type  = var.vm_machine_type
  zone          = var.zone
  subnetwork    = module.vpc.subnet_name
  tags          = ["ssh-enabled"]
}

output "vm_instance_name" {
  description = "The name of the VM instance"
  value       = module.vm.instance_name
}

output "vm_instance_ip" {
  description = "The internal IP address of the VM instance"
  value       = module.vm.instance_ip
}

output "vpc_network_name" {
  description = "The name of the VPC network"
  value       = module.vpc.network_name
}

output "vpc_subnet_name" {
  description = "The name of the VPC subnet"
  value       = module.vpc.subnet_name
}

output "psc_name" {
  description = "The name of the Private Service Connect endpoint"
  value       = module.psc.private_service_connect_name
}

output "psc_ip_address" {
  description = "The IP address of the Private Service Connect endpoint"
  value       = module.psc.private_service_connect_ip_address
}

module "cloudsql" {
  source                  = "../../modules/cloudsql"
  project_id              = var.project_id
  db_server_name          = var.db_server_name
  db_name                 = var.db_name
  db_version              = var.db_version
  availability_type       = var.availability_type
  backup_start_time       = var.backup_start_time
  backup_location         = var.backup_location
  maintenance_window_hour = var.maintenance_window_hour
  maintenance_window_day  = var.maintenance_window_day
  database_flags          = var.database_flags
  deletion_protection     = var.deletion_protection
  network                 = module.vpc.network_self_link
  vpc_connection          = module.vpc.private_vpc_connection
}

output "cloudsql_primary_instance_name" {
  description = "The name of the primary Cloud SQL instance"
  value       = module.cloudsql.primary_instance_name
}

output "cloudsql_replica_instance_name" {
  description = "The name of the replica Cloud SQL instance"
  value       = module.cloudsql.replica_instance_name
}

output "cloudsql_primary_connection_name" {
  description = "The connection name of the primary Cloud SQL instance"
  value       = module.cloudsql.primary_connection_name
}

output "cloudsql_replica_connection_name" {
  description = "The connection name of the replica Cloud SQL instance"
  value       = module.cloudsql.replica_connection_name
}

output "cloudsql_replica_private_ip" {
  description = "The private IP address of the replica Cloud SQL instance"
  value       = module.cloudsql.replica_private_ip_address
}

output "cloudsql_replica_psc_endpoint" {
  description = "The Private Service Connect endpoint for the replica Cloud SQL instance"
  value       = module.cloudsql.replica_psc_service_attachment_uri
}

output "cloudsql_database_name" {
  description = "The name of the database"
  value       = module.cloudsql.database_name
}

output "cloudsql_primary_self_link" {
  description = "The URI of the primary Cloud SQL instance"
  value       = module.cloudsql.primary_self_link
}

output "cloudsql_replica_self_link" {
  description = "The URI of the replica Cloud SQL instance"
  value       = module.cloudsql.replica_self_link
}
