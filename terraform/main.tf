module "vpc" {
  source = "./modules/vpc"
}

module "security_groups" {
  source = "./modules/security-groups"

  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "./modules/iam"
}

module "s3" {
  source = "./modules/s3"
}