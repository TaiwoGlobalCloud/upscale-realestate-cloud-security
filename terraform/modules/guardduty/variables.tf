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
  description = "Common AWS tags"
  type        = map(string)
}