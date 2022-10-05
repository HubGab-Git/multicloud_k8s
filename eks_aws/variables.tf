variable "region" {
  type        = string
  description = "Region where should EKS will be placed"
}

variable "name" {
  type        = string
  description = "Name of EKS cluster"
}

variable "eks_version" {
  type        = string
  default     = "1.23"
  description = "Version of EKS"
}

variable "instance_type" {
  type        = string
  default     = "t3.small"
  description = "Instance type for EKS nodes"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR of VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnets cidrs in VPC"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnets cidrs in VPC"
}

variable "azs" {
  type        = list(string)
  description = "List of AZ where should be nodes"
}