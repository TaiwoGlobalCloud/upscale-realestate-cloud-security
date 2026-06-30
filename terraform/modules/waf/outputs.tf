####################################################
# WAF Outputs
####################################################

output "web_acl_arn" {
  description = "AWS WAF Web ACL ARN"
  value       = aws_wafv2_web_acl.web_acl.arn
}

output "web_acl_id" {
  description = "AWS WAF Web ACL ID"
  value       = aws_wafv2_web_acl.web_acl.id
}