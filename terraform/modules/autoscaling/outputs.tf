####################################################
# Auto Scaling Group Outputs
####################################################

output "autoscaling_group_name" {
  description = "Auto Scaling Group Name"
  value       = aws_autoscaling_group.app.name
}

output "autoscaling_group_arn" {
  description = "Auto Scaling Group ARN"
  value       = aws_autoscaling_group.app.arn
}