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
# EC2 Configuration
####################################################

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

####################################################
# IAM Instance Profile
####################################################

variable "instance_profile_name" {
  description = "IAM Instance Profile Name"
  type        = string
}

####################################################
# Application Security Group
####################################################

variable "application_security_group_id" {
  description = "Application Security Group ID"
  type        = string
}

####################################################
# User Data
####################################################

variable "user_data" {
  description = "User data script for EC2 instances"
  type        = string
  default     = ""
}