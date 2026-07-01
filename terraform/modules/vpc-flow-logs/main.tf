####################################################
# IAM Role for VPC Flow Logs
####################################################

resource "aws_iam_role" "flow_logs" {

  name = "${var.project_name}-flowlogs-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "vpc-flow-logs.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-flowlogs-role"
    }
  )
}

####################################################
# IAM Policy
####################################################

resource "aws_iam_role_policy" "flow_logs" {

  name = "${var.project_name}-flowlogs-policy"

  role = aws_iam_role.flow_logs.id

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {
        Effect = "Allow"

        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"
        ]

        Resource = "*"
      }
    ]
  })
}

####################################################
# CloudWatch Log Group
####################################################

resource "aws_cloudwatch_log_group" "flow_logs" {

  name = "/aws/vpc/${var.project_name}/flowlogs"

  retention_in_days = 30

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-flowlogs"
    }
  )
}

####################################################
# VPC Flow Logs
####################################################

resource "aws_flow_log" "vpc" {

  vpc_id = var.vpc_id

  traffic_type = "ALL"

  log_destination_type = "cloud-watch-logs"

  log_destination = aws_cloudwatch_log_group.flow_logs.arn

  iam_role_arn = aws_iam_role.flow_logs.arn

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-vpc-flowlogs"
    }
  )
}