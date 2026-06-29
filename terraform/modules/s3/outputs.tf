####################################################
# S3 Bucket Outputs
####################################################

output "bucket_id" {
  description = "ID of the S3 bucket"
  value       = aws_s3_bucket.property_images.id
}

output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.property_images.bucket
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.property_images.arn
}

output "bucket_domain_name" {
  description = "Regional domain name of the S3 bucket"
  value       = aws_s3_bucket.property_images.bucket_regional_domain_name
}