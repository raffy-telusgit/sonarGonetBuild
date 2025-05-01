output "instance_name" {
  description = "The name of the database instance"
  value       = google_sql_database_instance.instance_update.name
}

output "connection_name" {
  description = "The connection name of the instance to be used in connection strings"
  value       = google_sql_database_instance.instance_update.connection_name
}

output "private_ip_address" {
  description = "The private IP address of the instance"
  value       = google_sql_database_instance.instance_update.private_ip_address
}

output "psc_service_attachment_uri" {
  description = "The PSC service attachment URI for the instance"
  value       = google_sql_database_instance.instance_update.psc_service_attachment_link
}

output "database_name" {
  description = "The name of the database"
  value       = google_sql_database.database.name
}

output "self_link" {
  description = "The URI of the instance"
  value       = google_sql_database_instance.instance_update.self_link
}
