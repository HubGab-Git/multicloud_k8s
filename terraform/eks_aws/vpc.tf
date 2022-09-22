
# VPC where EKS will be placed
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.14.4"

  cidr = var.vpc_cidr
  public_subnets  = var.subnets
  azs             = var.azs
}