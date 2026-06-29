####################################################
# RDS Outputs
####################################################

output "db_instance_id" {
  description = "RDS Instance ID"
  value       = aws_db_instance.postgres.id
}

output "db_instance_endpoint" {
  description = "RDS Endpoint"
  value       = aws_db_instance.postgres.endpoint
}

output "db_instance_address" {
  description = "RDS Address"
  value       = aws_db_instance.postgres.address
}

output "db_secret_arn" {
  description = "Secrets Manager ARN"
  value       = aws_secretsmanager_secret.db_credentials.arn
}