variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_a_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "public_subnet_b_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "private_app_subnet_a_cidr" {
  type    = string
  default = "10.0.11.0/24"
}

variable "private_app_subnet_b_cidr" {
  type    = string
  default = "10.0.12.0/24"
}

variable "private_db_subnet_a_cidr" {
  type    = string
  default = "10.0.21.0/24"
}

variable "private_db_subnet_b_cidr" {
  type    = string
  default = "10.0.22.0/24"
}

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