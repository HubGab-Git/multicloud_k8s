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