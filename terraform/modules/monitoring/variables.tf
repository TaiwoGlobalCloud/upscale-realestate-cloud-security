####################################################
# Project Information
####################################################

variable "project_name" {
  description = "Project name"
  type        = string
}

####################################################
# Common Resource Tags
####################################################

variable "common_tags" {
  description = "Common tags applied to AWS resources"
  type        = map(string)
}

####################################################
# CloudWatch Log Retention
####################################################

variable "log_retention_days" {
  description = "CloudWatch log retention period"
  type        = number
  default     = 30
}

####################################################
# Resource Names
####################################################

variable "autoscaling_group_name" {
  description = "Auto Scaling Group Name"
  type        = string
}

variable "db_instance_id" {
  description = "RDS Instance ID"
  type        = string
}

variable "alb_name" {
  description = "Application Load Balancer Name"
  type        = string
}