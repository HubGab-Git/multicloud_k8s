

 terraform {

  backend "s3" {
    bucket = "multicloud-k8s-tf-backend"
    key    = "tf.state"
    region = "eu-west-1"
    dynamodb_table = "multicloud-k8s-tf-state-lock"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.31.0"
    }
    # kubernetes = {
    #   source = "hashicorp/kubernetes"
    #   version = "~> 2.13.1"
    # }
    # google = {
    #   source = "hashicorp/google"
    #   version = "~> 4.36.0"
    # }
    # azurerm = {
    #   source = "hashicorp/azurerm"
    #   version = "~> 3.23.0"
    # }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}

# provider "google" {
#   project     = "multicloud-k8s-362708"
#   region      = "europe-central2"
# }
# provider "azurerm" {
#   features {}
# }

# provider "kubernetes" {
#   # Configuration options
# }