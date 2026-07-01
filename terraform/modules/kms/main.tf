####################################################
# AWS KMS Key
####################################################

resource "aws_kms_key" "this" {

  description             = "Customer managed KMS key for ${var.project_name}"
  deletion_window_in_days = 30

  enable_key_rotation = true

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-kms-key"
    }
  )
}

####################################################
# KMS Alias
####################################################

resource "aws_kms_alias" "this" {

  name = "alias/${var.project_name}"

  target_key_id = aws_kms_key.this.key_id
}