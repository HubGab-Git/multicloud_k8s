

terraform {

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
    # kubernetes = {
    #   source = "hashicorp/kubernetes"
    #   version = "~> 2.13.1"
    # }
    google = {
      source  = "hashicorp/google"
      version = "~> 4.36.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 3.23.0"
    }
  }
}

provider "aws" {
  region = aws.region
}

provider "google" {
  project = var.gcp.project_id
  region  = var.gcp.region
  zone    = var.gcp.zone
  credentials = file(var.gcp.credentials)
}
provider "azurerm" {
  features {}
}
