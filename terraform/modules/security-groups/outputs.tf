output "alb_security_group_id" {
  description = "ALB Security Group ID"
  value       = aws_security_group.alb_sg.id
}

output "app_security_group_id" {
  description = "Application Security Group ID"
  value       = aws_security_group.app_sg.id
}

output "db_security_group_id" {
  description = "Database Security Group ID"
  value       = aws_security_group.db_sg.id
}