provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.77.0"

  name = "votingapp-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.1.0"
  cluster_name    = "voting-app"
  cluster_version = "1.21"
  subnets         = module.vpc.public_subnets

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "m5.large"
      key_name      = var.key_name
      subnet_ids    = module.vpc.public_subnets

      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    }
  }
}

resource "aws_security_group" "worker_group_mgmt_one" {
  name_prefix = "worker_group_mgmt_one"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "worker_group_mgmt_one_ingress" {
  security_group_id = aws_security_group.worker_group_mgmt_one.id

  type        = "ingress"
  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"
  cidr_blocks = ["10.0.0.0/8"]
}

resource "aws_security_group_rule" "worker_group_mgmt_one_egress" {
  security_group_id = aws_security_group.worker_group_mgmt_one.id

  type        = "egress"
  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

