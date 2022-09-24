 module eks_aws {
    source  = "./eks_aws"
    region = var.aws.region
    name = var.aws.cluster.name
    vpc_cidr = var.aws.vpc_cidr
    subnets = ["10.0.101.0/24", "10.0.102.0/24"]
    azs = ["eu-west-1a","eu-west-1b"]
}

module "gke_gcp" {
  source  = "./gke_gcp"
  project = var.gcp.project_id
  region  = var.gcp.region
  zones   = [var.gcp.zone]
  name    = var.gcp.cluster.name
  service_account = var.gcp.cluster.service_account
  subnet_cidr = var.gcp.cluster.subnet_cidr
}