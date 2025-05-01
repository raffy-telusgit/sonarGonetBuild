resource "google_sql_database_instance" "instance" {
  name             = var.db_server_name
  database_version = var.db_version
  project          = var.project_id
  region           = var.backup_location

  settings {
    tier              = var.instance_tier
    availability_type = var.availability_type

    backup_configuration {
      enabled                        = true
      start_time                     = var.backup_start_time
      location                       = var.backup_location
      point_in_time_recovery_enabled = true
    }

    maintenance_window {
      day          = var.maintenance_window_day
      hour         = var.maintenance_window_hour
      update_track = "stable"
    }

    dynamic "database_flags" {
      for_each = var.database_flags
      content {
        name  = database_flags.key
        value = database_flags.value
      }
    }

    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = var.network
      enable_private_path_for_google_cloud_services = true
      # Remove PSC config as we're using VPC peering
      # psc_config {
      #   psc_enabled               = var.psc_config.enabled
      #   allowed_consumer_projects = var.psc_config.allowed_consumer_projects
      # }
    }

    depends_on = [
      var.vpc_connection
    ]
  }

  deletion_protection = var.deletion_protection
}

resource "google_sql_database" "database" {
  name     = var.db_name
  instance = google_sql_database_instance.instance.name
  project  = var.project_id
}
