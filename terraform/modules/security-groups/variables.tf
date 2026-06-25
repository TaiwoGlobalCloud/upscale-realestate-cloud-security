variable "vpc_id" {
  description = "VPC ID where security groups will be created"
  type        = string
}

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