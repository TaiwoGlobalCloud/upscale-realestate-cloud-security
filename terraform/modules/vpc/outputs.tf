####################################################
# VPC Outputs
####################################################

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.upscale_vpc.id
}

####################################################
# Public Subnets
####################################################

output "public_subnet_a_id" {
  description = "Public Subnet A ID"
  value       = aws_subnet.public_a.id
}

output "public_subnet_b_id" {
  description = "Public Subnet B ID"
  value       = aws_subnet.public_b.id
}

output "public_subnet_ids" {
  description = "List of Public Subnet IDs"
  value = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id
  ]
}

####################################################
# Private Application Subnets
####################################################

output "private_app_subnet_a_id" {
  description = "Private Application Subnet A ID"
  value       = aws_subnet.private_app_a.id
}

output "private_app_subnet_b_id" {
  description = "Private Application Subnet B ID"
  value       = aws_subnet.private_app_b.id
}

output "private_app_subnet_ids" {
  description = "List of Private Application Subnet IDs"
  value = [
    aws_subnet.private_app_a.id,
    aws_subnet.private_app_b.id
  ]
}

####################################################
# Private Database Subnets
####################################################

output "private_db_subnet_a_id" {
  description = "Private Database Subnet A ID"
  value       = aws_subnet.private_db_a.id
}

output "private_db_subnet_b_id" {
  description = "Private Database Subnet B ID"
  value       = aws_subnet.private_db_b.id
}

output "private_db_subnet_ids" {
  description = "List of Private Database Subnet IDs"
  value = [
    aws_subnet.private_db_a.id,
    aws_subnet.private_db_b.id
  ]
}