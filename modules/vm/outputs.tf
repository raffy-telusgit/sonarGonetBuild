output "instance_name" {
  description = "The name of the VM instance"
  value       = google_compute_instance.vm_instance.name
}

output "instance_ip" {
  description = "The internal IP address of the VM instance"
  value       = google_compute_instance.vm_instance.network_interface[0].network_ip
}
