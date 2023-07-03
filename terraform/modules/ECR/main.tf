
data "aws_caller_identity" "current" {}

module "ecr" {
  source          = "terraform-aws-modules/ecr/aws"
  version         = "1.6.0"
  repository_name = var.repo_name
  # force_destroy   = true    #need test

  repository_read_write_access_arns = [data.aws_caller_identity.current.arn]
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 30 images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = 30
        },
        action = {
          type = "expire"
        }
      }
    ]
  })

  tags = {
    environment = var.env_tag
  }

}


