resource "google_compute_global_address" "private_service_connect" {
  project      = var.project_id
  name         = "${var.network_name}-private-service-connect"
  address_type = "INTERNAL"
  purpose      = "PRIVATE_SERVICE_CONNECT"
  network      = var.network_id
  description  = "TF generated global IP address for private service connect"
  address      = var.psc_address
}

resource "google_compute_global_forwarding_rule" "forwarding_rule_private_service_connect" {
  provider              = google-beta
  project               = var.project_id
  name                  = "pscfwdrule${substr(md5(var.network_name), 0, 8)}"
  target                = "all-apis"
  network               = var.network_id
  ip_address            = google_compute_global_address.private_service_connect.id
  load_balancing_scheme = ""
  description           = "TF generated forwarding rule for PSC ${var.network_name}-private-service-connect"
}
