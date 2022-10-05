
# VPC where EKS will be placed
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.14.4"

  cidr                 = var.vpc_cidr
  private_subnets      = var.private_subnets
  public_subnets       = var.public_subnets
  azs                  = var.azs
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
}