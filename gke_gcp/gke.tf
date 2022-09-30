module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project
  name                       = var.name
  regional                   = false
  region                     = var.region
  zones                      = var.zones
  network                    = google_compute_network.vpc.name
  subnetwork                 = google_compute_subnetwork.subnet.name
  ip_range_pods              = ""
  ip_range_services          = ""
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = true

  node_pools = [
    {
      name               = "default-node-pool"
      machine_type       = var.instance_type
      min_count          = 1
      max_count          = 1
      spot               = true
      disk_size_gb       = 10
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      service_account    = var.service_account
      spot               = true
      initial_node_count = 1
    },
  ]
  depends_on = [
    google_project_service.compute,
    google_project_service.container,
    google_project_service.cloudresourcemanager
  ]
}
