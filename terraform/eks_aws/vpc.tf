module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.14.4"

  cidr = "10.0.0.0/16"
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
  azs             = ["eu-west-1a","eu-west-1b"]
}