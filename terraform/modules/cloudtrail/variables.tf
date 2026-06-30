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
  description = "Common AWS resource tags"
  type        = map(string)
}

####################################################
# CloudTrail S3 Bucket
####################################################

variable "bucket_name" {
  description = "S3 bucket for CloudTrail logs"
  type        = string
}