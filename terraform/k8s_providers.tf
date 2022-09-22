#  module eks_aws {
#     source  = "./eks_aws"
#     region = local.region
#     eks_cluster_name = "eks_cluster"
#     vpc_cidr = "10.0.0.0/16"
#     subnets = ["10.0.101.0/24", "10.0.102.0/24"]
#     azs = ["eu-west-1a","eu-west-1b"]
# }

module gke_gcp {
    source  = "./gke_gcp"
}