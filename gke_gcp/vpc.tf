# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.project}-vpc"
  routing_mode            = "REGIONAL"
  auto_create_subnetworks = "false"
  depends_on = [
    google_project_service.compute,
    google_project_service.container,
    google_project_service.cloudresourcemanager
  ]
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.id
  ip_cidr_range = var.subnet_cidr
}