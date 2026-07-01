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
# KMS Key ARN
####################################################

variable "kms_key_arn" {
  description = "Customer-managed KMS Key ARN for S3 encryption"
  type        = string
}