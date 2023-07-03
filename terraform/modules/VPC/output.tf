output "azs" {
  description = "name of azs"
  value       = module.vpc.azs
}

output "vpc_id" {
  description = "name of vpc"
  value       = module.vpc.vpc_id
}


output "private_subnets" {
  description = "name of vpc"
  value       = module.vpc.private_subnets
}