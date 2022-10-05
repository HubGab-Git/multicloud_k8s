variable "gcp" {
  type = object({
    project_id  = string
    region      = string
    zone        = string
    credentials = string
    cluster = object({
      name            = string
      service_account = string
      subnet_cidr     = string
    })
  })
  description = "GCP related variables"
}

variable "aws" {
  type = object({
    region          = string
    azs             = list(string)
    vpc_cidr        = string
    public_subnets  = list(string)
    private_subnets = list(string)
    cluster         = string
  })
  description = "AWS related variables"
}

variable "azure" {
  type = object({
    appId    = string
    password = string
  })
  description = "Azure related variables"
}