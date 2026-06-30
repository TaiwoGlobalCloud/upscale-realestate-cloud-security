####################################################
# GuardDuty Detector
####################################################

resource "aws_guardduty_detector" "this" {

  enable = true

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-guardduty"
    }
  )
}