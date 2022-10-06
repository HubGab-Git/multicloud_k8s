# Multicloud k8s

Frst commits of project..  
created module for eks without variables and outputs   
Project in progres...  


Known Issues:

az feature register --namespace Microsoft.ContainerService -n AutoUpgradePreview

google Ip v6


az ad sp create-for-rbac --skip-assignment


resolv.conf 8.8.8.8

gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)

terraform apply --auto-approve --refresh=false --target=module.k8s_aws.kubernetes_deployment.nginx

Error: Failed to identify fetch peer certificates
│ 
│   with module.eks_aws.module.eks.data.tls_certificate.this[0],
│   on .terraform/modules/eks_aws.eks/main.tf line 201, in data "tls_certificate" "this":
│  201: data "tls_certificate" "this" {
│ 
│ failed to fetch certificates from URL 'https': Get "https://oidc.eks.eu-west-1.amazonaws.com:443/id/7BE4EB75A4A654B5D7B7246E8BD2BF4E": dial tcp: lookup
│ oidc.eks.eu-west-1.amazonaws.com on 62.179.1.62:53: read udp 192.168.1.145:0->62.179.1.62:53: i/o timeout



│ Error: Failed to create deployment: Post "https://7BE4EB75A4A654B5D7B7246E8BD2BF4E.yl4.eu-west-1.eks.amazonaws.com/apis/apps/v1/namespaces/default/deployments": dial tcp: lookup 7BE4EB75A4A654B5D7B7246E8BD2BF4E.yl4.eu-west-1.eks.amazonaws.com: i/o timeout
│ 
│   with module.k8s_aws.kubernetes_deployment.nginx,
│   on k8s_deployment/deployment.tf line 3, in resource "kubernetes_deployment" "nginx":
│    3: resource "kubernetes_deployment" "nginx" {
│ 
╵


# Terraform MultiCloud K8S

## Description 

This terraform project provision simple nginx deployment on three cloud providers:
* AWS Elastic Kubernetes Service
* GCP Google Kubernetes Engine
* Azure Kubernetes Service


## Table of Contents 

* [Prerequisites](#prerequisites)
* [Usage](#usage)
* [Issues](#issues)


## Prerequisites

You need basic familiarity with Kubernetes and  `kubectl`  but does not assume any pre-existing deployment.

It also assumes that you are familiar with the usual Terraform plan/apply workflow. If you're new to Terraform itself, refer first to the Getting Started  [tutorial](https://developer.hashicorp.com/terraform/tutorials#get-started).

Before you start using this project, you will need:
* For EKS:
	-   an  [AWS account](https://portal.aws.amazon.com/billing/signup?nc2=h_ct&src=default&redirect_url=https%3A%2F%2Faws.amazon.com%2Fregistration-confirmation#/start)
	-   the AWS CLI,  [installed](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)  and  [configured](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
* For GKE:
	-   a  [GCP account](https://console.cloud.google.com/)
	-   a configured [gcloud SDK](https://developer.hashicorp.com/terraform/tutorials/kubernetes/gke#prerequisites)
	- create project in GCP account with 
* For AKS:
	-   an  [Azure account](https://portal.azure.com/#home)
	-   a configured [Azure CLI](https://developer.hashicorp.com/terraform/tutorials/kubernetes/aks#prerequisites)
	
* Kubernetes CLI [ `kubectl`](https://kubernetes.io/docs/reference/tools/)
* [Git](https://git-scm.com/downloads) 
* Terraform CLI 

## Usage 

When you have all needed CLIs you can start using this project:

 1. Clone this repo to local machine:
```md
git clone https://github.com/HubGab-Git/multicloud_k8s.git
```
 2. Enter downloaded folder:
```md
cd multicloud_k8s
```
 3. Open file terraform.tfvars ( for example in vs code):
```md
code terraform.tfvars
```
This file you have to fill your data from GCP and Azure:
* Create project in GCP:
	```md
	sudo gcloud projects create --name multicloud-demo
	```

  
5. Download all needed terraform providers and modules:
```md
terraform init
```

## Credits

List your collaborators, if any, with links to their GitHub profiles.

If you used any third-party assets that require attribution, list the creators with links to their primary web presence in this section.

If you followed tutorials, include links to those here as well.


## Issues

Provisioning can take about 2 hours
The last section of a good README is a license. This lets other developers know what they can and cannot do with your project. If you need help choosing a license, use [https://choosealicense.com/](https://choosealicense.com/)


---

🏆 The sections listed above are the minimum for a good README, but your project will ultimately determine the content of this document. You might also want to consider adding the following sections.

## Badges

![badmath](https://img.shields.io/github/languages/top/nielsenjared/badmath)

Badges aren't _necessary_, per se, but they demonstrate street cred. Badges let other developers know that you know what you're doing. Check out the badges hosted by [shields.io](https://shields.io/). You may not understand what they all represent now, but you will in time.


## Features

If your project has a lot of features, consider adding a heading called "Features" and listing them there.


## Contributing

If you created an application or package and would like other developers to contribute it, you will want to add guidelines for how to do so. The [Contributor Covenant](https://www.contributor-covenant.org/) is an industry standard, but you can always write your own.

## Tests

Go the extra mile and write tests for your application. Then provide examples on how to run them.