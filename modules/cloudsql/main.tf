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
      ipv4_enabled = false
    }
  }

  deletion_protection = var.deletion_protection

  lifecycle {
    ignore_changes = [
      settings[0].ip_configuration,
    ]
  }
}

resource "google_sql_database_instance" "instance_update" {
  name                = var.db_server_name
  project             = var.project_id
  region              = var.backup_location
  database_version    = var.db_version
  master_instance_name = google_sql_database_instance.instance.name

  settings {
    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = var.network
      enable_private_path_for_google_cloud_services = true
    }
  }

  deletion_protection = var.deletion_protection

  depends_on = [
    var.vpc_connection,
    google_sql_database_instance.instance
  ]
}

resource "google_sql_database" "database" {
  name     = var.db_name
  instance = google_sql_database_instance.instance.name
  project  = var.project_id
}
