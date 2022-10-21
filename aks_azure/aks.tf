
resource "azurerm_kubernetes_cluster" "default" {
  name                              = "aks-${random_id.prefix.hex}"
  location                          = azurerm_resource_group.main.location
  resource_group_name               = azurerm_resource_group.main.name
  dns_prefix                        = "k8s-${random_id.prefix.hex}"
  automatic_channel_upgrade         = "stable"
  role_based_access_control_enabled = true

  default_node_pool {
    name            = "default"
    node_count      = 1
    vm_size         = var.instance_type
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.password
  }
}