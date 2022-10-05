output "kube_config" {
  value       = azurerm_kubernetes_cluster.default.kube_config[0]
  description = "AKS cluster kube config variable"
}

output "cluster_name" {
  value       = azurerm_kubernetes_cluster.default.name
  description = "AKS cluster Name"
}

output "rg_name" {
  value       = azurerm_resource_group.main.name
  description = "Azure Resource Group Name where aks was provision"
}