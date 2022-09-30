output "aws_region" {
  description = "AWS region"
  value       = var.aws.region
}

output "aws_cluster_name" {
  description = "Kubernetes AWS Cluster Name"
  value       = module.eks_aws.cluster_name
}

output "gcp_region" {
  description = "GCP region"
  value       = var.gcp.region
}

output "gcp_cluster_name" {
  description = "Kubernetes GCP Cluster Name"
  value       = module.gke_gcp.cluster_name
}

output "azure_resource_group_name" {
    description = "Azure resource name"
    value = module.aks_azure.rg_name
}

output "azure_cluster_name" {
    description = "Azure cluster name"
    value = module.aks_azure.cluster_name
}