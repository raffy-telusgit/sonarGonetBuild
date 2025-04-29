output "instance_name" {
  description = "The name of the Cloud SQL instance"
  value       = google_sql_database_instance.instance.name
}

output "connection_name" {
  description = "The connection name of the Cloud SQL instance"
  value       = google_sql_database_instance.instance.connection_name
}

output "private_ip_address" {
  description = "The private IP address of the Cloud SQL instance"
  value       = google_sql_database_instance.instance.private_ip_address
}

output "psc_service_attachment_uri" {
  description = "The Private Service Connect service attachment URI"
  value       = google_sql_database_instance.instance.psc_service_attachment_link
}

output "database_name" {
  description = "The name of the database"
  value       = google_sql_database.database.name
}

output "self_link" {
  description = "The URI of the Cloud SQL instance"
  value       = google_sql_database_instance.instance.self_link
}
