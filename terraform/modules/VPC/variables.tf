variable "region" {
  type        = string
  description = "VPC region."
}

variable "vpc_name" {
  type        = string
  description = "VPC name."
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "private_subnets_cidr_blocks" {
  type        = list(string)
  description = "The CIDR blocks for the private subnets."
}

variable "public_subnets_cidr_blocks" {
  type        = list(string)
  description = "The CIDR blocks for the public subnets."
}

variable "enable_nat_gateway" {
  type        = string
  description = "Specify if NAT gateways should be enabled for the subnets."
}

#true
variable "single_nat_gateway" {
  type        = string
  description = "Specify if a single NAT gateway should be used for all private subnets."
}

variable "enable_dns_hostnames" {
  type        = string
  description = "Specify if DNS hostnames should be enabled for the VPC."
}
