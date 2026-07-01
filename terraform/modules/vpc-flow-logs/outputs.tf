####################################################
# VPC Flow Logs Outputs
####################################################

output "flow_log_id" {
  description = "VPC Flow Log ID"
  value       = aws_flow_log.vpc.id
}

output "flow_log_group_name" {
  description = "CloudWatch Log Group"
  value       = aws_cloudwatch_log_group.flow_logs.name
}