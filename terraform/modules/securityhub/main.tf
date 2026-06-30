####################################################
# AWS Security Hub
####################################################

resource "aws_securityhub_account" "this" {

  enable_default_standards = true

}