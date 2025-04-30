project_id = "sonar-gonet-lab-env-lab-0308cf"
region = "northamerica-northeast1"
zone = "northamerica-northeast1-a"
network_name = "np-vpc"
subnet_name = "np-subnet"
subnet_cidr = "10.0.0.0/24"
vm_instance_name = "np-vm"
vm_machine_type = "e2-medium"
project_terraform_state_gcs_bucket_name = "sonar-gonet-lab-env-lab-tfstate"

# Cloud SQL configuration
db_server_name          = "sonar-gonet-postgres-np"
db_name                 = "SonarGonetPostgressTestDB"
db_version              = "POSTGRES_14"
availability_type       = "REGIONAL"
backup_start_time       = "06:00"
backup_location         = "northamerica-northeast1"
maintenance_window_hour = "8"
maintenance_window_day  = "6"
database_flags          = {
  max_connections = "20"
}
#query_insights_enabled  = false
query_string_length     = "2056"
deletion_protection     = true
psc_config = {
  enabled                   = true
  allowed_consumer_projects = ["sonar-gonet-lab-env-lab-0308cf"]
}
