####################################################
# VPC Configuration
####################################################

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

####################################################
# Public Subnets
####################################################

variable "public_subnet_a_cidr" {
  description = "CIDR block for Public Subnet A"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_b_cidr" {
  description = "CIDR block for Public Subnet B"
  type        = string
  default     = "10.0.2.0/24"
}

####################################################
# Private Application Subnets
####################################################

variable "private_app_subnet_a_cidr" {
  description = "CIDR block for Private Application Subnet A"
  type        = string
  default     = "10.0.11.0/24"
}

variable "private_app_subnet_b_cidr" {
  description = "CIDR block for Private Application Subnet B"
  type        = string
  default     = "10.0.12.0/24"
}

####################################################
# Private Database Subnets
####################################################

variable "private_db_subnet_a_cidr" {
  description = "CIDR block for Private Database Subnet A"
  type        = string
  default     = "10.0.21.0/24"
}

variable "private_db_subnet_b_cidr" {
  description = "CIDR block for Private Database Subnet B"
  type        = string
  default     = "10.0.22.0/24"
}

####################################################
# Availability Zones
####################################################

variable "availability_zone_a" {
  description = "Primary Availability Zone"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zone_b" {
  description = "Secondary Availability Zone"
  type        = string
  default     = "us-east-1b"
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