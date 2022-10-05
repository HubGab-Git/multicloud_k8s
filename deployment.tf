
## Kubernetes deployments
## they provision the same simple nginx deployment on each cloud provider
module "k8s_azure" {
  source = "./k8s_deployment"
  providers = {
    kubernetes = kubernetes.azure
  }
}

module "k8s_aws" {
  source = "./k8s_deployment"
  providers = {
    kubernetes = kubernetes.aws
  }
}

module "k8s_gcp" {
  source = "./k8s_deployment"
  providers = {
    kubernetes = kubernetes.gcp
  }
}