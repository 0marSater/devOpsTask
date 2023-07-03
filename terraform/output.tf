#vpc
output "azs" {
  description = "name of azs"
  value       = module.VPC.azs
}

output "vpc_id" {
  description = "name of vpc"
  value       = module.VPC.vpc_id
}

output "private_subnets" {
  description = "name of vpc"
  value       = module.VPC.private_subnets
}

#rds
output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.RDS.db_instance_address
}

#eks
output "cluster_name" {
  description = "The name of the cluster"
  value       = module.EKS.cluster_name
}


output "cluster_oidc_issuer_url" {
  description = "The cluster oidc issuer url"
  value       = module.EKS.cluster_oidc_issuer_url
}


output "oidc_provider" {
  description = "The cluster oidc provider"
  value       = module.EKS.oidc_provider
}

output "cluster_endpoint" {
  description = "The cluster cluster endpoint"
  value       = module.EKS.cluster_endpoint
}


output "cluster_certificate_authority_data" {
  description = "The cluster certificate authority data"
  value       = module.EKS.cluster_certificate_authority_data
}

#ecr
output "repository_url" {
  description = "The URL of the repository"
  value       = module.ECR.repository_url
}

#alb