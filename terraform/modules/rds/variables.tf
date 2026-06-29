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
# Networking
####################################################

variable "private_db_subnet_ids" {
  description = "Private Database Subnet IDs"
  type        = list(string)
}

variable "db_security_group_id" {
  description = "Database Security Group ID"
  type        = string
}

####################################################
# Database Configuration
####################################################

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "upscaledb"
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
  default     = "dbadmin"
}

variable "engine_version" {
  description = "PostgreSQL engine version"
  type        = string
  default     = "17"
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage (GB)"
  type        = number
  default     = 20
}

####################################################
# Availability
####################################################

variable "multi_az" {
  description = "Enable Multi-AZ deployment"
  type        = bool
  default     = false
}