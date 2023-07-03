provider "aws" {
  region = var.region
}

#retrive the azs from specific region exist in provider --> eu-west-2
data "aws_availability_zones" "azs" {}

module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "4.0.2"
  name                 = var.vpc_name
  cidr                 = var.vpc_cidr_block
  private_subnets      = var.private_subnets_cidr_blocks
  public_subnets       = var.public_subnets_cidr_blocks
  azs                  = slice(data.aws_availability_zones.azs.names, 0, 2) #retrive only 2 azs 
  enable_nat_gateway   = var.enable_nat_gateway
  single_nat_gateway   = var.single_nat_gateway
  enable_dns_hostnames = var.enable_dns_hostnames

  #tags for vpc, to let know cloud control manager which vpc used for cluster
  tags = {
    "kubernetes.io/cluster/myapp-eks-cluster" = "shared"
  }

  #tag subnets
  public_subnet_tags = {
    "kubernetes.io/cluster/myapp-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                  = 1

  }

  private_subnet_tags = {
    "kubernetes.io/cluster/myapp-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"         = 1
  }

}

