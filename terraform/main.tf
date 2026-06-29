####################################################
# VPC Module
####################################################

module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  common_tags  = local.common_tags
}

####################################################
# Security Groups Module
####################################################

module "security_groups" {
  source = "./modules/security-groups"

  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  common_tags  = local.common_tags
}

####################################################
# IAM Module
####################################################

module "iam" {
  source = "./modules/iam"

  project_name = var.project_name
  common_tags  = local.common_tags
}

####################################################
# S3 Module
####################################################

module "s3" {
  source = "./modules/s3"

  project_name = var.project_name
  common_tags  = local.common_tags
}

####################################################
# Application Load Balancer Module
####################################################

module "alb" {
  source = "./modules/alb"

  project_name = var.project_name
  common_tags  = local.common_tags

  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  alb_security_group_id = module.security_groups.alb_security_group_id
}

####################################################
# Launch Template Module
####################################################

module "launch_template" {
  source = "./modules/launch-template"

  project_name = var.project_name
  common_tags  = local.common_tags

  instance_profile_name         = module.iam.instance_profile_name
  application_security_group_id = module.security_groups.app_security_group_id
}