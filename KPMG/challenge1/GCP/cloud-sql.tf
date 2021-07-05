
resource "google_compute_global_address" "private_ip_address" {
  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = module.network.network_self_link
  project = var.projectId
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = module.network.subnets_self_links[1]
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}

resource "google_project_service" "networking" {
  project = var.projectId
  service = "servicenetworking.googleapis.com"

  disable_dependent_services = true
}

resource "google_project_service" "sqladmin" {
  project = var.projectId
  service = "sqladmin.googleapis.com"

  disable_dependent_services = true
}

resource "google_sql_database_instance" "gcp-cloud-sql" {
  project = var.projectId
  name   = var.dbname
  region = var.region
  database_version = var.dbversion
  depends_on = [
    google_service_networking_connection.private_vpc_connection,
    google_project_service.networking,
    google_project_service.sqladmin
  ]

  settings {
    tier = var.tier
    ip_configuration {
      ipv4_enabled    = false
      private_network = module.network.network_self_link
    }
  }
}

resource "google_sql_user" "users" {
  name     = "commander"
  instance = google_sql_database_instance.gcp-cloud-sql.name
  host     = "%"
  password = "commander"
  project = var.projectId
}

output "db_private_ip" {
  value       = google_sql_database_instance.gcp-cloud-sql.private_ip_address
}