resource "aws_vpc" "upscale_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-vpc"
  })
}

####################################################
# Internet Gateway
####################################################

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.upscale_vpc.id

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-igw"
  })
}

####################################################
# Public Subnets
####################################################

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.upscale_vpc.id
  cidr_block              = var.public_subnet_a_cidr
  availability_zone       = var.availability_zone_a
  map_public_ip_on_launch = true

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-public-subnet-a"
  })
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.upscale_vpc.id
  cidr_block              = var.public_subnet_b_cidr
  availability_zone       = var.availability_zone_b
  map_public_ip_on_launch = true

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-public-subnet-b"
  })
}

####################################################
# Private Application Subnets
####################################################

resource "aws_subnet" "private_app_a" {
  vpc_id            = aws_vpc.upscale_vpc.id
  cidr_block        = var.private_app_subnet_a_cidr
  availability_zone = var.availability_zone_a

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-private-app-a"
  })
}

resource "aws_subnet" "private_app_b" {
  vpc_id            = aws_vpc.upscale_vpc.id
  cidr_block        = var.private_app_subnet_b_cidr
  availability_zone = var.availability_zone_b

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-private-app-b"
  })
}

####################################################
# Private Database Subnets
####################################################

resource "aws_subnet" "private_db_a" {
  vpc_id            = aws_vpc.upscale_vpc.id
  cidr_block        = var.private_db_subnet_a_cidr
  availability_zone = var.availability_zone_a

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-private-db-a"
  })
}

resource "aws_subnet" "private_db_b" {
  vpc_id            = aws_vpc.upscale_vpc.id
  cidr_block        = var.private_db_subnet_b_cidr
  availability_zone = var.availability_zone_b

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-private-db-b"
  })
}

####################################################
# Elastic IP
####################################################

resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-nat-eip"
  })
}

####################################################
# NAT Gateway
####################################################

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_a.id

  depends_on = [aws_internet_gateway.igw]

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-nat-gateway"
  })
}

####################################################
# Public Route Table
####################################################

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.upscale_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-public-route-table"
  })
}

resource "aws_route_table_association" "public_a_assoc" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_b_assoc" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public_rt.id
}

####################################################
# Private Route Table
####################################################

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.upscale_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-private-route-table"
  })
}

resource "aws_route_table_association" "private_app_a_assoc" {
  subnet_id      = aws_subnet.private_app_a.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_app_b_assoc" {
  subnet_id      = aws_subnet.private_app_b.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_db_a_assoc" {
  subnet_id      = aws_subnet.private_db_a.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_db_b_assoc" {
  subnet_id      = aws_subnet.private_db_b.id
  route_table_id = aws_route_table.private_rt.id
}