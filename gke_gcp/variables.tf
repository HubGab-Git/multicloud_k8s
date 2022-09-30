variable "region" {
  type        = string
  description = "Region where should GKE will be placed"
}

variable "name" {
  type        = string
  description = "Name of GKE cluster"
}

variable "instance_type" {
  type        = string
  default     = "e2-micro"
  description = "Instance type for GKE nodes"
}

variable "zones" {
  type        = list(string)
  description = "List of zones where should be nodes"
}

variable "project" {
  type        = string
  description = "Name of GCP project"
}

variable "service_account" {
  type        = string
  description = "Service account for access to requred resources"
}

variable "subnet_cidr" {
  type        = string
  description = "IP range subnet CIDR"
}