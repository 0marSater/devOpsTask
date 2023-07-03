variable "cluster_name" {
  type        = string
  description = "The name of the cluster."
}

variable "policy_name" {
  type        = string
  description = "The name of policy which will be attach to the role."
}

variable "iam_role_name" {
  type        = string
  description = "The name of iam role that will be attahced to the service account."
}

variable "cluster_oidc_issuer_url" {
  type        = string
  description = "The URL of the OIDC issuer for the cluster."
}

variable "oidc_provider" {
  type        = string
  description = "The name of the OIDC provider associated with the cluster."
}

variable "cluster_endpoint" {
  type        = string
  description = "The endpoint URL for the cluster."
}

variable "cluster_certificate_authority_data" {
  type        = string
  description = "The certificate authority data for the cluster."
}

variable "namespace" {
  type        = string
  description = "The namespace where aws load balancer controller exist."
}

variable "service_account_name" {
  type        = string
  description = "The name of the service account for the cluster."
}

variable "vpc_id" {
  type        = string
  description = "The ID of (VPC) associated with the cluster."
}

variable "region" {
  type        = string
  description = "The region where the cluster is located."
}
