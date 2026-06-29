####################################################
# VPC Outputs
####################################################

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

####################################################
# Security Group Outputs
####################################################

output "alb_security_group_id" {
  description = "ALB Security Group ID"
  value       = module.security_groups.alb_security_group_id
}

output "application_security_group_id" {
  description = "Application Security Group ID"
  value       = module.security_groups.app_security_group_id
}

output "database_security_group_id" {
  description = "Database Security Group ID"
  value       = module.security_groups.db_security_group_id
}

####################################################
# IAM Outputs
####################################################

output "instance_profile_name" {
  description = "EC2 Instance Profile"
  value       = module.iam.instance_profile_name
}

####################################################
# S3 Outputs
####################################################

output "bucket_name" {
  description = "Property Images Bucket"
  value       = module.s3.bucket_name
}

####################################################
# Application Load Balancer Outputs
####################################################

output "alb_id" {
  description = "Application Load Balancer ID"
  value       = module.alb.alb_id
}

output "alb_arn" {
  description = "Application Load Balancer ARN"
  value       = module.alb.alb_arn
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS Name"
  value       = module.alb.alb_dns_name
}

output "alb_zone_id" {
  description = "Application Load Balancer Hosted Zone ID"
  value       = module.alb.alb_zone_id
}

output "target_group_arn" {
  description = "Application Target Group ARN"
  value       = module.alb.target_group_arn
}

####################################################
# Launch Template Outputs
####################################################

output "launch_template_id" {
  description = "Launch Template ID"
  value       = module.launch_template.launch_template_id
}

output "launch_template_arn" {
  description = "Launch Template ARN"
  value       = module.launch_template.launch_template_arn
}

output "launch_template_latest_version" {
  description = "Latest Launch Template Version"
  value       = module.launch_template.launch_template_latest_version
}