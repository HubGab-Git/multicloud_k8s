module eks {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 18.29.0"
    cluster_name    = "eks-cluster"
    cluster_version = "1.23"
    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.public_subnets
    eks_managed_node_group_defaults = {
        disk_size      = 4
        instance_types = ["t3.nano"]
        ami_type       = "AL2_x86_64"
    }
    eks_managed_node_groups = {
    control_plane = {
        disk_size      = 4
      min_size     = 1
      max_size     = 1
      desired_size = 1

      instance_types = ["t3.nano"]
      capacity_type  = "SPOT"
    }
  }

}