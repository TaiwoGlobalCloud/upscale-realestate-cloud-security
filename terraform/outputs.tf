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