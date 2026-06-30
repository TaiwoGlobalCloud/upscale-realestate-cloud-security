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

  user_data = <<-EOF
#!/bin/bash
dnf update -y

dnf install -y nginx

systemctl enable nginx
systemctl start nginx

cat > /usr/share/nginx/html/index.html <<HTML
<!DOCTYPE html>
<html>
<head>
<title>Upscale Real Estate</title>
</head>
<body style="font-family: Arial; text-align:center; margin-top:80px;">
<h1>Upscale Real Estate Cloud Platform</h1>
<h2>Infrastructure Successfully Deployed</h2>
<p>Provisioned with Terraform on AWS</p>
<p>Auto Scaling • Application Load Balancer • PostgreSQL • S3</p>
</body>
</html>
HTML
EOF
}

####################################################
# Auto Scaling Module
####################################################

module "autoscaling" {
  source = "./modules/autoscaling"

  project_name = var.project_name
  common_tags  = local.common_tags

  launch_template_id     = module.launch_template.launch_template_id
  target_group_arn       = module.alb.target_group_arn
  private_app_subnet_ids = module.vpc.private_app_subnet_ids
}

####################################################
# RDS Module
####################################################

module "rds" {
  source = "./modules/rds"

  project_name = var.project_name
  common_tags  = local.common_tags

  private_db_subnet_ids = module.vpc.private_db_subnet_ids
  db_security_group_id  = module.security_groups.db_security_group_id
}

####################################################
# Monitoring Module
####################################################

module "monitoring" {
  source = "./modules/monitoring"

  project_name = var.project_name
  common_tags  = local.common_tags

  autoscaling_group_name = module.autoscaling.autoscaling_group_name
  db_instance_id         = module.rds.db_instance_id

  # Reserved for future ALB monitoring enhancements
  alb_name = module.alb.alb_id
}

####################################################
# WAF Module
####################################################

module "waf" {
  source = "./modules/waf"

  project_name = var.project_name
  common_tags  = local.common_tags

  alb_arn = module.alb.alb_arn
}

####################################################
# CloudTrail Module
####################################################

module "cloudtrail" {
  source = "./modules/cloudtrail"

  project_name = var.project_name
  common_tags  = local.common_tags

  # Dedicated CloudTrail logging bucket
  bucket_name = module.s3.cloudtrail_bucket_name
}

####################################################
# GuardDuty Module
####################################################

module "guardduty" {
  source = "./modules/guardduty"

  project_name = var.project_name
  common_tags  = local.common_tags
}

####################################################
# Security Hub Module
####################################################

module "securityhub" {
  source = "./modules/securityhub"

  project_name = var.project_name
  common_tags  = local.common_tags
}