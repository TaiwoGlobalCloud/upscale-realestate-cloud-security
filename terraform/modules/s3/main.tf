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
# Versioning
####################################################

resource "aws_s3_bucket_versioning" "property_images" {

  bucket = aws_s3_bucket.property_images.id

  versioning_configuration {
    status = "Enabled"
  }
}

####################################################
# Server-Side Encryption
####################################################

resource "aws_s3_bucket_server_side_encryption_configuration" "property_images" {

  bucket = aws_s3_bucket.property_images.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"
    }
  }
}

####################################################
# Block Public Access
####################################################

resource "aws_s3_bucket_public_access_block" "property_images" {

  bucket = aws_s3_bucket.property_images.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}