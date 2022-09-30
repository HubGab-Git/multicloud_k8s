resource "azurerm_resource_group" "main" {
  location = var.location
  name     = coalesce(var.resource_group_name, "${random_id.prefix.hex}-rg")
}

# Random hex generator for RG and Cluster name
resource "random_id" "prefix" {
  byte_length = 8
}

locals {
  resource_group = {
    name     = azurerm_resource_group.main.name
    location = var.location
  }
}