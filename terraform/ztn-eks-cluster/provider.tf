provider "aws" {
  region = "us-east-1"
  # prerequisite locally: aws configure --profile <cluster-name>
  # profile = ${local.cluster_name}
}

# provider "kubernetes" {
#   host                   = module.eks.cluster_endpoint
#   cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

#   exec {
#     api_version = "client.authentication.k8s.io/v1beta1"
#     command     = "aws"
#     # This requires the awscli to be installed locally where Terraform is executed
#     args = ["--profile", ${local.cluster_name}, "eks", "get-token", "--cluster-name", var.cluster_name]
#   }
# }