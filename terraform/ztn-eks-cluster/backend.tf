terraform {
  backend "s3" {
    dynamodb_table = "ztnhub-tfstate-lock"
    bucket         = "ztnhub-tfstate"
    key            = "ztn/terraform/ztn-eks-cluster.tfstate"
    region         = "us-east-1"
  }
}
