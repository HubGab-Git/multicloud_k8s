module "eks_aws" {
  source          = "./eks_aws"
  region          = var.aws.region
  name            = var.aws.cluster
  vpc_cidr        = var.aws.vpc_cidr
  public_subnets  = var.aws.public_subnets
  private_subnets = var.aws.private_subnets
  azs             = var.aws.azs
}

module "gke_gcp" {
  source          = "./gke_gcp"
  project         = var.gcp.project_id
  region          = var.gcp.region
  zones           = [var.gcp.zone]
  name            = var.gcp.cluster.name
  service_account = var.gcp.cluster.service_account
  subnet_cidr     = var.gcp.cluster.subnet_cidr
}

module "aks_azure" {
  source    = "./aks_azure"
  client_id = var.azure.appId
  password  = var.azure.password
}