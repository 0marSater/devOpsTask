#vpc
region                      = "eu-west-2"
vpc_name                    = "myapp-vpc"
vpc_cidr_block              = "10.0.0.0/16"
private_subnets_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnets_cidr_blocks  = ["10.0.3.0/24", "10.0.4.0/24"]
enable_nat_gateway          = true
single_nat_gateway          = true
enable_dns_hostnames        = true

#rds
instance_name            = "task-db"
instance_class           = "db.t3.micro"
allocated_storage        = 20
db_name                  = "ipAdresses"
username                 = "admin"
password                 = "12345678db"
port                     = 3306
delete_automated_backups = true
skip_final_snapshot      = true
publicly_accessible      = true

#eks
cluster_name                   = "myapp-eks-cluster"
cluster_version                = "1.26"
env_tag                        = "dev"
min_size                       = 1
max_size                       = 1
desired_size                   = 1
instance_types                 = ["t2.medium"]
coredns_version                = "v1.9.3-eksbuild.2"
kube_proxy_version             = "v1.26.2-eksbuild.1"
vpc_cni_version                = "v1.12.5-eksbuild.2"
cluster_endpoint_public_access = true

#ecr
repo_name = "task-repo"

#alb
service_account_name = "aws-load-balancer-controller-sa"
policy_name          = "load-balancer-controller-iam-policy"
iam_role_name        = "load-balancer-role-terraform"
namespace            = "kube-system"




