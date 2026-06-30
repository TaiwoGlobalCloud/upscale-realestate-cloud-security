####################################################
# Security Hub Outputs
####################################################

output "securityhub_account_id" {
  description = "Security Hub Account ID"
  value       = aws_securityhub_account.this.id
}