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

  

You need basic familiarity with Kubernetes and `kubectl` but does not assume any pre-existing deployment.

  

It also assumes that you are familiar with the usual Terraform plan/apply workflow. If you're new to Terraform itself, refer first to the Getting Started [tutorial](https://developer.hashicorp.com/terraform/tutorials#get-started).

  

Before you start using this project, you will need:

* For EKS:

	- an [AWS account](https://portal.aws.amazon.com/billing/signup?nc2=h_ct&src=default&redirect_url=https%3A%2F%2Faws.amazon.com%2Fregistration-confirmation#/start)

	- the AWS CLI, [installed](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and [configured](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)

* For GKE:

	- a [GCP account](https://console.cloud.google.com/)

	- a configured [gcloud SDK](https://developer.hashicorp.com/terraform/tutorials/kubernetes/gke#prerequisites)

	- create project in GCP account with

* For AKS:

	- an [Azure account](https://portal.azure.com/#home)

	- a configured [Azure CLI](https://developer.hashicorp.com/terraform/tutorials/kubernetes/aks#prerequisites)

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
	sudo gcloud projects create --name <your project name>
	```
	* Confirm Project ID.
	
		console output should be like below:

	 	![Create GCP project](https://raw.githubusercontent.com/HubGab-Git/multicloud_k8s/80a0bebea2c2b3e1616b7177879f67d9485aafda/images/createGCPproject.png)

  * Copy Project ID into terraform.tfvars file into line 7:

  	![Copy Project ID into terraform.tfvars file](https://raw.githubusercontent.com/HubGab-Git/multicloud_k8s/main/images/projectIDinVars.png)
 
 * Create Service Account for Terraform to be able provision resources:
	 ```md
	gcloud iam service-accounts create <Name of your Service Account>
	```
	example:

	![Create SA](https://raw.githubusercontent.com/HubGab-Git/multicloud_k8s/main/images/createSA.png)

* Type your service account email into terraform.tsvars file into line 22:

	![SA in Vars](https://raw.githubusercontent.com/HubGab-Git/multicloud_k8s/main/images/SAinVars.png)

* Assign "owner" role to newly created service account:
	```md
	gcloud projects add-iam-policy-binding <ProjectID>  \  
	--member="serviceAccount:<SAName>@<ProjectID>.iam.gserviceaccount.com"  \
	role="roles/owner"
	```
	example:

	![Assign Role to SA](https://raw.githubusercontent.com/HubGab-Git/multicloud_k8s/main/images/AssignRoleToSA.png)
* Download json file with Service Account credentials:

	```md
	gcloud iam service-accounts keys create credentials.json \
	    --iam-account=<SAName>@<ProjectID>.iam.gserviceaccount.com  
	```
	example: 

	![ Download credentials file ](https://raw.githubusercontent.com/HubGab-Git/multicloud_k8s/main/images/downloadCredentials.png)
* Type path to credentials file in terraform.tfvar file into line 15:

	![Credentials File in Vars](https://raw.githubusercontent.com/HubGab-Git/multicloud_k8s/main/images/credentialsInVars.png)
* GCP data was full-filed now Azure, only one Azure command to get  Service Principal credentials:
	```md
	az ad sp create-for-rbac --skip-assignment
	```
	example:

	![Azure command](https://raw.githubusercontent.com/HubGab-Git/multicloud_k8s/main/images/ServicePrincipalCredentials.png)
* Type appId and password in terraform.tsvars file into lines 49 and 50:

	![AZ Credentials in Vars](https://raw.githubusercontent.com/HubGab-Git/multicloud_k8s/main/images/SPCredendialsInVars.png)
	
5. Now we can start on terraform. Download all needed terraform providers and modules:

	```md
	terraform init
	```
6. Check terraform plan if this is your desired project state:
	```md
	terraform plan
	```
7. Finally provision all resources:
	 ```md
	terraform apply --auto-approve
	```

8. Now you can check deployments in EKS, GKE and AKS:
* EKS:
	* Connect EKS with kubectl:
		```md
		aws eks --region $(terraform output -raw aws_region) update-kubeconfig \ 
		--name $(terraform output -raw aws_cluster_name)
		``` 
	* Show e.q. pods:
		```md
		kubectl get po
		```
* GKE:
	*  Connect GKE with kubectl:
		```md
		gcloud container clusters get-credentials $(terraform output -raw gcp_cluster_name) --region $(terraform output -raw gcp_region)
		```
	* Show e.q. pods:
		```md
		kubectl get po
		```
* AKS:
	*  Connect AKS with kubectl:
		```md
		az aks get-credentials --resource-group $(terraform output -raw azure_resource_group_name) --name $(terraform output -raw azure_cluster_name)
		```
	* Show e.q. pods:
		```md
		az aks command invoke \
		  --resource-group $(terraform output -raw azure_resource_group_name) \
		  --name $(terraform output -raw azure_cluster_name) \
		  --command "kubectl get po" 
		 ```
## Issues

Provisioning can take about 30-120 minutes.

If you face errors like below:
```md
Error: Failed to identify fetch peer certificates
│
│ with module.eks_aws.module.eks.data.tls_certificate.this[0],
│ on .terraform/modules/eks_aws.eks/main.tf line 201, in data "tls_certificate" "this":
│ 201: data "tls_certificate" "this" {
│
│ failed to fetch certificates from URL 'https': Get "https://oidc.eks.eu-west-1.amazonaws.com:443/id/7BE4EB75A4A654B5D7B7246E8BD2BF4E": dial tcp: lookup
│ oidc.eks.eu-west-1.amazonaws.com on 62.179.1.62:53: read udp 192.168.1.145:0->62.179.1.62:53: i/o timeout


│ Error: Failed to create deployment: Post "https://7BE4EB75A4A654B5D7B7246E8BD2BF4E.yl4.eu-west-1.eks.amazonaws.com/apis/apps/v1/namespaces/default/deployments": dial tcp: lookup 7BE4EB75A4A654B5D7B7246E8BD2BF4E.yl4.eu-west-1.eks.amazonaws.com: i/o timeout
│
│ with module.k8s_aws.kubernetes_deployment.nginx,
│ on k8s_deployment/deployment.tf line 3, in resource "kubernetes_deployment" "nginx":
│ 3: resource "kubernetes_deployment" "nginx" {
│
╵
```

Or Any error which contains:
```md
 ... dial tcp: lookup ...
 ... i/o timeout ...

```

This probably means that terraform cannot handle IPv6 addresses correctly.
my fast workaround for this is assign IPv4 addresses for affected domains:

1. Copy domain and find IPv4 for it, for example by "ping" command:
![Ping example](https://raw.githubusercontent.com/HubGab-Git/multicloud_k8s/main/images/ping.png)
2. Type domain name and IP into "hosts" file, bellow my example host file:
	```md
	##
	# Host Database
	#
	# localhost is used to configure the loopback interface
	# when the system is booting. Do not change this entry.
	##
	127.0.0.1  localhost
	255.255.255.255  broadcasthost
	::1  localhost
	142.250.203.202  oauth2.googleapis.com
	216.58.215.74  compute.googleapis.com
	142.250.186.202  container.googleapis.com
	172.217.16.10  cloudresourcemanager.googleapis.com
	142.250.203.138  iam.googleapis.com
	216.58.208.202  serviceusage.googleapis.com
	# Added by Docker Desktop
	# To allow the same kube context to work on the host and the container:
	127.0.0.1  kubernetes.docker.internal
	# End of section
	51.116.62.189  management.azure.com
	51.11.173.167  k8s-3d28e68f1819d816-0a1504f2.hcp.uksouth.azmk8s.io
	34.248.242.151  78cda35666e1ca76dd11076693eaab38.gr7.eu-west-1.eks.amazonaws.com
	52.49.87.145  7be4eb75a4a654b5d7b7246e8bd2bf4e.yl4.eu-west-1.eks.amazonaws.com
	52.208.7.143  oidc.eks.eu-west-1.amazonaws.com
	51.143.243.78  k8s-1efe6846b93f2095-423df77c.hcp.uksouth.azmk8s.io
	54.229.44.223  E642F2F9F0953B1086B35B0BBA53E2B4.sk1.eu-west-1.eks.amazonaws.com
	```

	What I understand is that issue is rather caused by "Go lang" rather than terraform which is developed by Go
	More information about this issue under this link: 
	https://github.com/hashicorp/terraform-provider-google/issues/6782