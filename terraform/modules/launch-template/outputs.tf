####################################################
# Launch Template Outputs
####################################################

output "launch_template_id" {
  description = "Launch Template ID"
  value       = aws_launch_template.app.id
}

output "launch_template_arn" {
  description = "Launch Template ARN"
  value       = aws_launch_template.app.arn
}

output "launch_template_latest_version" {
  description = "Latest Launch Template Version"
  value       = aws_launch_template.app.latest_version
}