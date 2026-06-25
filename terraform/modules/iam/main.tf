####################################################
# EC2 Assume Role Policy
####################################################

data "aws_iam_policy_document" "ec2_assume_role" {

  statement {

    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]

    principals {

      type = "Service"

      identifiers = [
        "ec2.amazonaws.com"
      ]
    }
  }
}

####################################################
# EC2 IAM Role
####################################################

resource "aws_iam_role" "ec2_role" {

  name = "${var.project_name}-ec2-role"

  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

  tags = {
    Name        = "${var.project_name}-ec2-role"
    Project     = var.project_name
    Environment = var.environment
    Owner       = var.owner
    ManagedBy   = "Terraform"
  }
}

####################################################
# CloudWatch Agent Policy
####################################################

resource "aws_iam_role_policy_attachment" "cloudwatch" {

  role = aws_iam_role.ec2_role.name

  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

####################################################
# AWS Systems Manager
####################################################

resource "aws_iam_role_policy_attachment" "ssm" {

  role = aws_iam_role.ec2_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

####################################################
# EC2 Instance Profile
####################################################

resource "aws_iam_instance_profile" "ec2_profile" {

  name = "${var.project_name}-instance-profile"

  role = aws_iam_role.ec2_role.name
}