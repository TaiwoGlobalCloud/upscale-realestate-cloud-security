####################################################
# CloudWatch Log Group
####################################################

resource "aws_cloudwatch_log_group" "application" {

  name = "/aws/${var.project_name}/application"

  retention_in_days = var.log_retention_days

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-application-log-group"
    }
  )
}

####################################################
# CloudWatch Dashboard
####################################################

resource "aws_cloudwatch_dashboard" "dashboard" {

  dashboard_name = "${var.project_name}-dashboard"

  dashboard_body = jsonencode({

    widgets = [

      {
        type   = "text"
        x      = 0
        y      = 0
        width  = 24
        height = 2

        properties = {
          markdown = "# ${var.project_name} Cloud Infrastructure Dashboard"
        }
      }
    ]
  })
}

####################################################
# EC2 CPU Alarm
####################################################

resource "aws_cloudwatch_metric_alarm" "high_cpu" {

  alarm_name          = "${var.project_name}-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2

  metric_name = "CPUUtilization"
  namespace   = "AWS/EC2"

  period    = 300
  statistic = "Average"

  threshold = 80

  dimensions = {
    AutoScalingGroupName = var.autoscaling_group_name
  }

  alarm_description = "High CPU Utilization"

  treat_missing_data = "missing"
}

####################################################
# RDS CPU Alarm
####################################################

resource "aws_cloudwatch_metric_alarm" "rds_cpu" {

  alarm_name          = "${var.project_name}-rds-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2

  metric_name = "CPUUtilization"
  namespace   = "AWS/RDS"

  period    = 300
  statistic = "Average"

  threshold = 80

  dimensions = {
    DBInstanceIdentifier = var.db_instance_id
  }

  alarm_description = "High RDS CPU Utilization"

  treat_missing_data = "missing"
}