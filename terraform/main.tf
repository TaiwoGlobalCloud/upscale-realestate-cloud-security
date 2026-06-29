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