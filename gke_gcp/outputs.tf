output "cluster_host" {
  value       = module.gke.endpoint
  description = "GKE cluster host"
}

output "ca_certificate" {
  value       = module.gke.ca_certificate
  description = "GKE cluster certificate authority"
}
output "cluster_name" {
  value       = module.gke.name
  description = "GKE cluster name"
}

output "cluster_region" {
  value       = module.gke.location
  description = "Cluster region"
}