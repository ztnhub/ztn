resource "aws_security_group" "eks-cluster-sg" {
    name        = "${local.cluster_name}"
    description = "Allow traffic"
    vpc_id      = module.vpc.vpc_id

    ingress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["10.0.0.0/8"]
    }

    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["10.0.0.0/8"]
    }
  }