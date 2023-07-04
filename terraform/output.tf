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


#ecr
output "repository_url" {
  description = "The URL of the repository"
  value       = module.ECR.repository_url
}

