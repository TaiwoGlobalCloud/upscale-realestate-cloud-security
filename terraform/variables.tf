####################################################
# Project Information
####################################################

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "upscale-realestate"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "development"
}

variable "owner" {
  description = "Resource owner"
  type        = string
  default     = "Taiwo Justice"
}

####################################################
# AWS Configuration
####################################################

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}