
####################################################
# AWS Caller Identity
####################################################

data "aws_caller_identity" "current" {}

####################################################
# AWS Region
####################################################

data "aws_region" "current" {}

####################################################
# Property Images Bucket
####################################################

resource "aws_s3_bucket" "property_images" {

  bucket = "${var.project_name}-property-images"

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-property-images"
    }
  )
}

####################################################
# Property Images Versioning
####################################################

resource "aws_s3_bucket_versioning" "property_images" {

  bucket = aws_s3_bucket.property_images.id

  versioning_configuration {
    status = "Enabled"
  }
}

####################################################
# Property Images Encryption
####################################################

resource "aws_s3_bucket_server_side_encryption_configuration" "property_images" {

  bucket = aws_s3_bucket.property_images.id

  rule {
    apply_server_side_encryption_by_default {

      sse_algorithm     = "aws:kms"
      kms_master_key_id = var.kms_key_arn
    }

    bucket_key_enabled = true
  }
}

####################################################
# Property Images Public Access Block
####################################################

resource "aws_s3_bucket_public_access_block" "property_images" {

  bucket = aws_s3_bucket.property_images.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

####################################################
# CloudTrail Log Bucket
####################################################

resource "aws_s3_bucket" "cloudtrail_logs" {

  bucket = "${var.project_name}-cloudtrail-logs"

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-cloudtrail-logs"
    }
  )
}

####################################################
# CloudTrail Versioning
####################################################

resource "aws_s3_bucket_versioning" "cloudtrail_logs" {

  bucket = aws_s3_bucket.cloudtrail_logs.id

  versioning_configuration {
    status = "Enabled"
  }
}

####################################################
# CloudTrail Encryption
####################################################

resource "aws_s3_bucket_server_side_encryption_configuration" "cloudtrail_logs" {

  bucket = aws_s3_bucket.cloudtrail_logs.id

  rule {
    apply_server_side_encryption_by_default {

      sse_algorithm     = "aws:kms"
      kms_master_key_id = var.kms_key_arn
    }

    bucket_key_enabled = true
  }
}

####################################################
# CloudTrail Public Access Block
####################################################

resource "aws_s3_bucket_public_access_block" "cloudtrail_logs" {

  bucket = aws_s3_bucket.cloudtrail_logs.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

####################################################
# CloudTrail Bucket Policy Document
####################################################

data "aws_iam_policy_document" "cloudtrail_bucket_policy" {

  statement {
    sid    = "AWSCloudTrailAclCheck"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions = [
      "s3:GetBucketAcl"
    ]

    resources = [
      aws_s3_bucket.cloudtrail_logs.arn
    ]
  }

  statement {
    sid    = "AWSCloudTrailWrite"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions = [
      "s3:PutObject"
    ]

    resources = [
      "${aws_s3_bucket.cloudtrail_logs.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"
    ]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"

      values = [
        "bucket-owner-full-control"
      ]
    }
  }
}

####################################################
# CloudTrail Bucket Policy
####################################################

resource "aws_s3_bucket_policy" "cloudtrail_logs" {

  bucket = aws_s3_bucket.cloudtrail_logs.id

  policy = data.aws_iam_policy_document.cloudtrail_bucket_policy.json
}