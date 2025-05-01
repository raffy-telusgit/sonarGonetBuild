output "private_service_connect_name" {
  description = "Name of the private service connect"
  value       = google_compute_global_address.private_service_connect.name
}

output "private_service_connect_ip_address" {
  description = "IP address of the private service connect"
  value       = google_compute_global_address.private_service_connect.address
}
