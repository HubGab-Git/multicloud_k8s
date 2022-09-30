variable "resource_group_name" {
  type        = string
  default     = null
  description = "Name of Rersource group"
}

variable "location" {
  type        = string
  default     = "UK South"
  description = "Name of region/.location of cluster"
}

variable "instance_type" {
  type        = string
  default     = "Standard_B2s"
  description = "Machines type of default node pool"
}

variable client_id {
  type = string
  description = "AppID for Service Principal RBAC"  
}

variable password {
  type = string
  description = "Password for Service Principal RBAC"
}