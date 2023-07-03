#vpc
variable "region" {
  type = string
}
variable "vpc_name" {
  type = string
}
variable "vpc_cidr_block" {
  type = string
}
variable "private_subnets_cidr_blocks" {}
variable "public_subnets_cidr_blocks" {}
variable "enable_nat_gateway" {
  type = string
}
variable "single_nat_gateway" {
  type = string
}
variable "enable_dns_hostnames" {
  type = string
}


#rds
variable "instance_name" {
  type = string
}
variable "instance_class" {
  type = string
}
variable "allocated_storage" {
  type = number
}
variable "db_name" {
  type = string
}
variable "username" {
  type = string
}
variable "password" {
  type = string
}
variable "port" {
  type = number
}
variable "env_tag" {
  type = string
}
variable "delete_automated_backups" {
  type = bool
}

variable "skip_final_snapshot" {
  type = bool
}

variable "publicly_accessible" {
  type = bool
}


#eks
variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
}


variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "desired_size" {
  type = number
}

variable "instance_types" {
  type = list(string)
}

variable "coredns_version" {
  type = string
}

variable "kube_proxy_version" {
  type = string
}

variable "vpc_cni_version" {
  type = string
}

variable "cluster_endpoint_public_access" {
  type = bool
}


#ecr
variable "repo_name" {
  type = string
}


#alb
variable "service_account_name" {
  type = string
}

variable "policy_name" {
  type = string
}

variable "iam_role_name" {
  type = string
}

variable "namespace" {
  type = string
}

