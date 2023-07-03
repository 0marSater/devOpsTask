variable "cluster_name" {
  type        = string
  description = "Cluster name."
}

variable "cluster_version" {
  type        = string
  description = "Cluster version."
}

variable "env_tag" {
  type        = string
  description = "The environment tag for the cluster."
}

variable "min_size" {
  type        = number
  description = "The minimum number of worker node."
}

variable "max_size" {
  type        = number
  description = "The maximum number of worker node."
}

variable "desired_size" {
  type        = number
  description = "The desire number of worker node."
}

variable "instance_types" {
  type        = list(string)
  description = "The list of instance types for the cluster nodes."
}

variable "coredns_version" {
  type        = string
  description = "The version of CoreDns."
}

variable "kube_proxy_version" {
  type        = string
  description = "The version of kube-proxy."
}

variable "vpc_cni_version" {
  type        = string
  description = "The version of VPC CNI plugin for the cluster."
}

variable "cluster_endpoint_public_access" {
  type        = bool
  description = "Specify if the cluster endpoint should be publicly accessible."
}

variable "vpc_id" {
  type        = string
  description = "The ID vpc associated with the cluster."
}

variable "private_subnets" {
  type        = list(string)
  description = "The list of private subnets where the cluster nodes will be deployed."
}
