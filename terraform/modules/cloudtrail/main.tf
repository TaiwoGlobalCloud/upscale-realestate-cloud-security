####################################################
# CloudTrail
####################################################

resource "aws_cloudtrail" "trail" {

  name = "${var.project_name}-cloudtrail"

  s3_bucket_name = var.bucket_name

  include_global_service_events = true

  is_multi_region_trail = true

  enable_logging = true

  enable_log_file_validation = true

  event_selector {

    read_write_type           = "All"
    include_management_events = true
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-cloudtrail"
    }
  )
}