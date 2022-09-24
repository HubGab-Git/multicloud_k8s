resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
  project = var.project
  disable_dependent_services = true
  disable_on_destroy = false
}

resource "google_project_service" "container" {
  service = "container.googleapis.com"
  project = var.project
  disable_dependent_services = true
  disable_on_destroy = false
}

resource "google_project_service" "cloudresourcemanager" {
  service = "cloudresourcemanager.googleapis.com"
  project = var.project
  disable_dependent_services = true
  disable_on_destroy = false
}
