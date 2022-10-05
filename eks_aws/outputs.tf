output "cluster_name" {
  value       = module.eks.cluster_id
  description = "EKS cluster name"
}

output "cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "EKS cluster endpoint url"
}

output "cluster_ca" {
  value       = module.eks.cluster_certificate_authority_data
  description = "EKS cluster certificate authority"
}

output "cluster_region" {
  value       = var.region
  description = "GKE cluster region"
}