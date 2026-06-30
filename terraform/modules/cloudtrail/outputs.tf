####################################################
# CloudTrail Outputs
####################################################

output "cloudtrail_id" {
  description = "CloudTrail ID"
  value       = aws_cloudtrail.trail.id
}

output "cloudtrail_arn" {
  description = "CloudTrail ARN"
  value       = aws_cloudtrail.trail.arn
}