

terraform {
  # secure backend on AWS s3, You can chose any you would like 
  backend "s3" {
    bucket         = "multicloud-k8s-tf-backend"
    key            = "tf.state"
    region         = "eu-west-1"
    dynamodb_table = "multicloud-k8s-tf-state-lock"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.31.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 4.36.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.23.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.13.1"
    }
  }
}

provider "aws" {
  region = var.aws.region
}

provider "google" {
  project     = var.gcp.project_id
  region      = var.gcp.region
  zone        = var.gcp.zone
  credentials = file(var.gcp.credentials)
}

data "google_client_config" "default" {}

provider "azurerm" {
  features {}
}


## Kubernetes configuration for each cloud providers 

provider "kubernetes" {
  alias = "azure"
  host  = module.aks_azure.kube_config.host

  client_certificate     = base64decode(module.aks_azure.kube_config.client_certificate)
  client_key             = base64decode(module.aks_azure.kube_config.client_key)
  cluster_ca_certificate = base64decode(module.aks_azure.kube_config.cluster_ca_certificate)
}

provider "kubernetes" {
  alias = "gcp"
  host  = "https://${module.gke_gcp.cluster_host}"

  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke_gcp.ca_certificate)
}

provider "kubernetes" {
  alias                  = "aws"
  host                   = module.eks_aws.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks_aws.cluster_ca)
  exec {
    api_version = "client.authentication.k8s.io/v1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      module.eks_aws.cluster_name
    ]
  }
}
