#catch the vpc_id from local terraform remote state file to pass it to the eks root module. 

#root EKS module
module "eks" {
  source                         = "terraform-aws-modules/eks/aws"
  version                        = "19.14.0"
  cluster_name                   = var.cluster_name
  cluster_version                = var.cluster_version
  vpc_id                         = var.vpc_id
  subnet_ids                     = var.private_subnets
  cluster_endpoint_public_access = var.cluster_endpoint_public_access


  tags = {
    environment = var.env_tag
  }

  # specify one or two worker nodes with different type if u want
  eks_managed_node_groups = {
    dev = {
      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size

      instance_types = var.instance_types
    }
  }

  # requried addons
  cluster_addons = {
    coredns = {
      addon_version     = var.coredns_version
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {
      addon_version     = var.kube_proxy_version
      resolve_conflicts = "OVERWRITE"
    }
    vpc-cni = {
      addon_version     = var.vpc_cni_version
      resolve_conflicts = "OVERWRITE"
    }
  }
}



