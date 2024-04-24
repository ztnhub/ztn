locals {
  cluster_name        = "ztn-eks-cluster"
  #route53_domain_name = data.terraform_remote_state.dns.outputs.r53_domain_name
}

################################################################################
# EKS Module
# Example Spot-Instances: 
# https://www.timcosta.io/creating-an-autoscaling-eks-cluster-using-spot-instances/
################################################################################
module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "20.5.0"

  cluster_name = local.cluster_name
  cluster_version = "1.28"
  cluster_endpoint_private_access       = true
  cluster_endpoint_public_access        = true
  cluster_additional_security_group_ids = [aws_security_group.eks-cluster-sg.id]
  
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = false

  cluster_tags = {
    "Environment" = "Production"
    "Project" = "ztn"
  }

  create_cloudwatch_log_group            = false //Set to true if cluster logs are needed on cloudwatch
  cloudwatch_log_group_retention_in_days = 2     //Overrides the default 90 days
  cluster_enabled_log_types              = []    //Removing the cluster logs posted to save cost. Can be added if needed in the future

  # eks_managed_node_group_defaults = {
  #   instance_types         = ["t3a.medium"]
  #   vpc_security_group_ids = [aws_security_group.eks-cluster-sg.id]
  # }

  cluster_addons = {
    coredns = {
      preserve    = true
      most_recent = true
      resolve_conflicts = "OVERWRITE"

      timeouts = {
        create = "25m"
        delete = "10m"
      }
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
      resolve_conflicts = "OVERWRITE"
    }
  }

  # eks_managed_node_groups = {
  #   ztn-nodes = {
  #     min_size     = 0
  #     max_size     = 2
  #     desired_size = 2

  #     instance_types = ["t3a.medium"]
  #     taints = {
  #     }
  #   }
  # }

  node_security_group_additional_rules = {
    egress_all = {
      description      = "Node all egress"
      protocol         = "-1"
      from_port        = 0
      to_port          = 0
      type             = "egress"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  tags = {
    "Environment" = "Production"
    "Project"     = "ztn"
  }
}

# Add a null_resource to trigger the local-exec provisioner after the EKS cluster is created
resource "null_resource" "kubeconfig" {
  triggers = {
    cluster_id = module.eks.cluster_id
  }

  provisioner "local-exec" {
    command = <<-EOT
      aws eks --region us-east-1 update-kubeconfig --name "${local.cluster_name}"
      kubectl config view --minify --flatten > kubeconfig.yaml
      echo "Kubeconfig saved to kubeconfig.yaml"
    EOT
  }
}
