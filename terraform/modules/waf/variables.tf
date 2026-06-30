####################################################
# Project Information
####################################################

variable "project_name" {
  description = "Project name"
  type        = string
}

####################################################
# Common Tags
####################################################

variable "common_tags" {
  description = "Common AWS resource tags"
  type        = map(string)
}

####################################################
# Application Load Balancer ARN
####################################################

variable "alb_arn" {
  description = "Application Load Balancer ARN"
  type        = string
}