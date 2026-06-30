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

####################################################
# Auto Scaling Outputs
####################################################

output "autoscaling_group_name" {
  description = "Auto Scaling Group Name"
  value       = module.autoscaling.autoscaling_group_name
}

output "autoscaling_group_arn" {
  description = "Auto Scaling Group ARN"
  value       = module.autoscaling.autoscaling_group_arn
}
####################################################
# RDS Outputs
####################################################

output "db_instance_id" {
  description = "RDS Instance ID"
  value       = module.rds.db_instance_id
}

output "db_instance_endpoint" {
  description = "RDS Endpoint"
  value       = module.rds.db_instance_endpoint
}

output "db_instance_address" {
  description = "RDS Address"
  value       = module.rds.db_instance_address
}

output "db_secret_arn" {
  description = "Secrets Manager ARN"
  value       = module.rds.db_secret_arn
}

####################################################
# Monitoring Outputs
####################################################

output "cloudwatch_log_group_name" {
  description = "CloudWatch Log Group Name"
  value       = module.monitoring.log_group_name
}

output "cloudwatch_dashboard_name" {
  description = "CloudWatch Dashboard Name"
  value       = module.monitoring.dashboard_name
}

####################################################
# WAF Outputs
####################################################

output "web_acl_id" {
  description = "AWS WAF Web ACL ID"
  value       = module.waf.web_acl_id
}

output "web_acl_arn" {
  description = "AWS WAF Web ACL ARN"
  value       = module.waf.web_acl_arn
}