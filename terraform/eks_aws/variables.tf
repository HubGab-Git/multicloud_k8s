variable region {
    type= string
    description = "Region where should EKS will be placed"
}

variable eks_cluster_name {
    type= string
    description = "Name of EKS cluster"
}

variable eks_version {
    type= string
    default="1.23"
    description = "Version of EKS"
}

variable instance_type {
    type= string
    default="t3.nano"
    description = "Instance type for EKS nodes"
}

variable vpc_cidr {
    type= string
    description = "CIDR of VPC"
}

variable subnets{
    type= list(string)
    description = "List of subnets cidrs in VPC"
}

variable azs {
    type= list(string)
    description = "List of AZ where should be nodes"
}