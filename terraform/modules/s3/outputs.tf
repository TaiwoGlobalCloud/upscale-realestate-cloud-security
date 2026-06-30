####################################################
# Property Images Bucket Outputs
####################################################

output "bucket_id" {
  description = "ID of the Property Images S3 bucket"
  value       = aws_s3_bucket.property_images.id
}

output "bucket_name" {
  description = "Name of the Property Images S3 bucket"
  value       = aws_s3_bucket.property_images.bucket
}

output "bucket_arn" {
  description = "ARN of the Property Images S3 bucket"
  value       = aws_s3_bucket.property_images.arn
}

output "bucket_domain_name" {
  description = "Regional domain name of the Property Images S3 bucket"
  value       = aws_s3_bucket.property_images.bucket_regional_domain_name
}

####################################################
# CloudTrail Log Bucket Outputs
####################################################

output "cloudtrail_bucket_id" {
  description = "ID of the CloudTrail Log S3 bucket"
  value       = aws_s3_bucket.cloudtrail_logs.id
}

output "cloudtrail_bucket_name" {
  description = "Name of the CloudTrail Log S3 bucket"
  value       = aws_s3_bucket.cloudtrail_logs.bucket
}

output "cloudtrail_bucket_arn" {
  description = "ARN of the CloudTrail Log S3 bucket"
  value       = aws_s3_bucket.cloudtrail_logs.arn
}

output "cloudtrail_bucket_domain_name" {
  description = "Regional domain name of the CloudTrail Log S3 bucket"
  value       = aws_s3_bucket.cloudtrail_logs.bucket_regional_domain_name
}