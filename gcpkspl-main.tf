resource "google_project" "gcpkspl" {
  name       = var.projectName
  project_id = var.projectNumber

}

resource "google_compute_network" "network_name" {
  name = "network_name"
}
resource "google_compute_subnetwork" "gcpkspl-public-subnetwork" {
  name          = "gcpkspl-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "region"
  network       = google_compute_network.network_name.name
}

resource "google_sql_database" "database" {
  name     = "my-database"
  instance = google_sql_database_instance.db-instance.name
}

resource "google_sql_database_instance" "db-instance" {
  name   = "database-instance-name"
  region = "region"
  database_version = "db-version"
  settings {
    tier = "db-e2-micro"
  }
  deletion_protection = "true"
}




