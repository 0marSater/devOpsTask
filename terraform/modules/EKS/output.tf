#EKS root environment output  
output "cluster_name" {
  description = "The name of the cluster."
  value       = module.eks.cluster_name
}


output "cluster_oidc_issuer_url" {
  description = "The cluster oidc issuer url."
  value       = module.eks.cluster_oidc_issuer_url
}


output "oidc_provider" {
  description = "The cluster oidc provider."
  value       = module.eks.oidc_provider
}



output "cluster_endpoint" {
  description = "The cluster endpoint."
  value       = module.eks.cluster_endpoint
}


output "cluster_certificate_authority_data" {
  description = "The cluster certificate authority data."
  value       = module.eks.cluster_certificate_authority_data
}