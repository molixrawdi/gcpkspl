resource "google_project" "gcpkspl" {
  name       = var.projectName
  project_id = var.projectNumber
  
}

resource "google_compute_network" "network_name" {
name = "network_name"
}
resource "google_compute_subnetwork" "gcpkspl-public-subnetwork" {
name = "gcpkspl-subnetwork"
ip_cidr_range = "10.2.0.0/16"
region = "region"
network = google_compute_network.network_name.name
}
