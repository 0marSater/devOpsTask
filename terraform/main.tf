data "aws_availability_zones" "azs" {}
module "VPC" {
  source                      = "./modules/VPC"
  region                      = var.region
  vpc_name                    = var.vpc_name
  vpc_cidr_block              = var.vpc_cidr_block
  private_subnets_cidr_blocks = var.private_subnets_cidr_blocks
  public_subnets_cidr_blocks  = var.public_subnets_cidr_blocks
  enable_nat_gateway          = var.enable_nat_gateway
  single_nat_gateway          = var.single_nat_gateway
  enable_dns_hostnames        = var.enable_dns_hostnames

}

module "RDS" {
  source                   = "./modules/RDS"
  instance_name            = var.instance_name
  instance_class           = var.instance_class
  allocated_storage        = var.allocated_storage
  db_name                  = var.db_name
  username                 = var.username
  password                 = var.password
  port                     = var.port
  env_tag                  = var.env_tag
  delete_automated_backups = var.delete_automated_backups
  skip_final_snapshot      = var.skip_final_snapshot
  publicly_accessible      = var.publicly_accessible
}

module "ECR" {
  source    = "./modules/ECR"
  repo_name = var.repo_name
  env_tag   = var.env_tag
}

module "EKS" {
  source                         = "./modules/EKS"
  cluster_name                   = var.cluster_name
  cluster_version                = var.cluster_version
  vpc_id                         = module.VPC.vpc_id
  private_subnets                = module.VPC.private_subnets
  env_tag                        = var.env_tag
  min_size                       = var.min_size
  max_size                       = var.max_size
  desired_size                   = var.desired_size
  instance_types                 = var.instance_types
  coredns_version                = var.coredns_version
  kube_proxy_version             = var.kube_proxy_version
  vpc_cni_version                = var.vpc_cni_version
  cluster_endpoint_public_access = var.cluster_endpoint_public_access
}

module "ALB" {
  source                             = "./modules/ALB"
  service_account_name               = var.service_account_name
  cluster_name                       = module.EKS.cluster_name
  policy_name                        = var.policy_name
  iam_role_name                      = var.iam_role_name
  namespace                          = var.namespace
  cluster_oidc_issuer_url            = module.EKS.cluster_oidc_issuer_url
  oidc_provider                      = module.EKS.oidc_provider
  cluster_certificate_authority_data = module.EKS.cluster_certificate_authority_data
  cluster_endpoint                   = module.EKS.cluster_endpoint
  vpc_id                             = module.VPC.vpc_id
  region                             = var.region
}






