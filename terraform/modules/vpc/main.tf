resource "aws_vpc" "upscale_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "upscale-realestate-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.upscale_vpc.id

  tags = {
    Name = "upscale-igw"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.upscale_vpc.id
  cidr_block              = var.public_subnet_a_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.upscale_vpc.id
  cidr_block              = var.public_subnet_b_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-b"
  }
}

resource "aws_subnet" "private_app_a" {
  vpc_id     = aws_vpc.upscale_vpc.id
  cidr_block = var.private_app_subnet_a_cidr

  tags = {
    Name = "private-app-a"
  }
}

resource "aws_subnet" "private_app_b" {
  vpc_id     = aws_vpc.upscale_vpc.id
  cidr_block = var.private_app_subnet_b_cidr

  tags = {
    Name = "private-app-b"
  }
}

resource "aws_subnet" "private_db_a" {
  vpc_id     = aws_vpc.upscale_vpc.id
  cidr_block = var.private_db_subnet_a_cidr

  tags = {
    Name = "private-db-a"
  }
}

resource "aws_subnet" "private_db_b" {
  vpc_id     = aws_vpc.upscale_vpc.id
  cidr_block = var.private_db_subnet_b_cidr

  tags = {
    Name = "private-db-b"
  }
}