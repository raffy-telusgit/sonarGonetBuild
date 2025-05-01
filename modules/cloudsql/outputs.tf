output "primary_instance_name" {
  description = "The name of the primary database instance"
  value       = google_sql_database_instance.instance.name
}

output "replica_instance_name" {
  description = "The name of the replica database instance"
  value       = google_sql_database_instance.instance_update.name
}

output "primary_connection_name" {
  description = "The connection name of the primary instance"
  value       = google_sql_database_instance.instance.connection_name
}

output "replica_connection_name" {
  description = "The connection name of the replica instance"
  value       = google_sql_database_instance.instance_update.connection_name
}

output "replica_private_ip_address" {
  description = "The private IP address of the replica instance"
  value       = google_sql_database_instance.instance_update.private_ip_address
}

output "replica_psc_service_attachment_uri" {
  description = "The PSC service attachment URI for the replica instance"
  value       = google_sql_database_instance.instance_update.psc_service_attachment_link
}

output "database_name" {
  description = "The name of the database"
  value       = google_sql_database.database.name
}

output "primary_self_link" {
  description = "The URI of the primary instance"
  value       = google_sql_database_instance.instance.self_link
}

output "replica_self_link" {
  description = "The URI of the replica instance"
  value       = google_sql_database_instance.instance_update.self_link
}
