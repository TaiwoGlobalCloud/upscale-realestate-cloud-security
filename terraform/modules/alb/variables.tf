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
# VPC
####################################################

variable "vpc_id" {
  description = "VPC ID where the ALB will be deployed"
  type        = string
}

####################################################
# Public Subnets
####################################################

variable "public_subnet_ids" {
  description = "Public subnet IDs for the Application Load Balancer"
  type        = list(string)
}

####################################################
# Security Group
####################################################

variable "alb_security_group_id" {
  description = "Security Group attached to the Application Load Balancer"
  type        = string
}