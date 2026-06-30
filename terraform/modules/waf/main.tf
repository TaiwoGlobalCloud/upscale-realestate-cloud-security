####################################################
# AWS WAF Web ACL
####################################################

resource "aws_wafv2_web_acl" "web_acl" {

  name  = "${var.project_name}-web-acl"
  scope = "REGIONAL"

  default_action {
    allow {}
  }

  ####################################################
  # AWS Managed Rules
  ####################################################

  rule {

    name     = "AWSManagedCommonRuleSet"
    priority = 1

    override_action {
      none {}
    }

    statement {

      managed_rule_group_statement {

        vendor_name = "AWS"
        name        = "AWSManagedRulesCommonRuleSet"
      }
    }

    visibility_config {

      cloudwatch_metrics_enabled = true
      metric_name                = "CommonRuleSet"
      sampled_requests_enabled   = true
    }
  }

  visibility_config {

    cloudwatch_metrics_enabled = true
    metric_name                = "${var.project_name}-waf"
    sampled_requests_enabled   = true
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-web-acl"
    }
  )
}

####################################################
# Associate WAF with ALB
####################################################

resource "aws_wafv2_web_acl_association" "alb" {

  resource_arn = var.alb_arn
  web_acl_arn  = aws_wafv2_web_acl.web_acl.arn
}