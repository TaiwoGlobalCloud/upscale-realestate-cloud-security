####################################################
# VPC Configuration
####################################################

variable "vpc_id" {
  description = "VPC ID where security groups will be created"
  type        = string
}

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