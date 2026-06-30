####################################################
# Latest Amazon Linux 2023 AMI
####################################################

data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

####################################################
# EC2 Launch Template
####################################################

resource "aws_launch_template" "app" {

  name_prefix = "${var.project_name}-"

  image_id = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  ####################################################
  # User Data
  ####################################################

  user_data = base64encode(var.user_data)

  update_default_version = true

  iam_instance_profile {
    name = var.instance_profile_name
  }

  vpc_security_group_ids = [
    var.application_security_group_id
  ]

  monitoring {
    enabled = true
  }

  block_device_mappings {

    device_name = "/dev/xvda"

    ebs {

      volume_size = 20

      volume_type = "gp3"

      encrypted = true

      delete_on_termination = true
    }
  }

  metadata_options {

    http_endpoint = "enabled"

    http_tokens = "required"

    http_put_response_hop_limit = 2
  }

  tag_specifications {

    resource_type = "instance"

    tags = merge(
      var.common_tags,
      {
        Name = "${var.project_name}-application-server"
      }
    )
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-launch-template"
    }
  )
}