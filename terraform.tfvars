gcp = {
  # project ID which you created in GCP
  # You Can create project by gcloud cli:
  # sudo gcloud projects create --name <your project name>
  # You can check avalible project IDs in gcloud cli: gcloud projects list
  # gcloud projects list
  project_id = "<Your GCP Project ID>"

  region = "us-central1"

  # Zone have to be in provided above region
  zone = "us-central1-b"

  # path to json file with credentilas to your GCP project
  credentials = "<Path to your GCP Service Account credentials json file>"

  cluster = {
    # name of GKE cluster of your choice 
    name = "gke-cluster"

    # Service Account in email format created by you allowing terraform to provision GKE in your GCP account 
    service_account = "<Your Service Account Name>@<Your GCP Project ID>.iam.gserviceaccount.com"

    # VPC subnet CIDR where GKE will be provisioned 
    subnet_cidr = "10.0.0.0/18"
  }
}
aws = {
  region = "eu-west-1"

  # CIDR of VPC where EKS will be provisioned
  vpc_cidr = "10.0.0.0/16"

  # CIDRs of subnets for EKS, there have to be at least two in diferent AZs
  # subnets have to contains in above VPC CIDR 
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  # two diferent AZ names from abouve provided region 
  azs = ["eu-west-1a", "eu-west-1b"]

  cluster = "eks-cluster"
}

azure = {

  # AppId and password for service principal RBAC
  # you can check it from Azure CLI:
  #   az ad sp create-for-rbac --skip-assignment
  appId    = "<Your appId>"
  password = "<Your Password for appID>"
}