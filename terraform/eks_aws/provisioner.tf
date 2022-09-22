
# Set EKS kubernetes context on local machine 
resource "null_resource" "run-pestertest" {
  provisioner "local-exec" {
    command = "aws eks --region ${var.region} update-kubeconfig --name ${module.eks.cluster_id}"
  }
  depends_on = [module.eks]
}