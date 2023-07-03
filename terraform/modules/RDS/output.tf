#RDS root environment output  
output "db_instance_address" {
  description = "The address of the RDS instance."
  value       = module.rds.db_instance_address
}