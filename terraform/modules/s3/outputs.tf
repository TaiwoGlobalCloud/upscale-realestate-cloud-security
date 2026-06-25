output "property_images_bucket" {

  description = "Property Images Bucket"

  value = aws_s3_bucket.property_images.bucket
}