module "rds" {
  source                   = "terraform-aws-modules/rds/aws"
  version                  = "5.9.0"
  engine                   = "mysql"
  engine_version           = "8.0"
  major_engine_version     = "8.0"
  family                   = "mysql8.0"
  instance_class           = var.instance_class
  identifier               = var.instance_name
  allocated_storage        = var.allocated_storage
  db_name                  = var.db_name
  username                 = var.username
  password                 = var.password
  port                     = var.port
  delete_automated_backups = var.delete_automated_backups
  skip_final_snapshot      = var.skip_final_snapshot
  publicly_accessible      = var.publicly_accessible

  tags = {
    environment = var.env_tag
  }
}

