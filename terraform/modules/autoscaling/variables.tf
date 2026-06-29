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
  description = "Common tags applied to all AWS resources"
  type        = map(string)
}

####################################################
# Launch Template
####################################################

variable "launch_template_id" {
  description = "Launch Template ID"
  type        = string
}

####################################################
# Target Group
####################################################

variable "target_group_arn" {
  description = "Application Load Balancer Target Group ARN"
  type        = string
}

####################################################
# Private Application Subnets
####################################################

variable "private_app_subnet_ids" {
  description = "Private Application Subnet IDs"
  type        = list(string)
}

####################################################
# Auto Scaling Capacity
####################################################

variable "min_size" {
  description = "Minimum number of EC2 instances"
  type        = number
  default     = 2
}

variable "desired_capacity" {
  description = "Desired number of EC2 instances"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of EC2 instances"
  type        = number
  default     = 4
}