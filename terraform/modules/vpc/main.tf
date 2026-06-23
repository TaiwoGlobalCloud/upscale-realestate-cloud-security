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

# -------------------------
# Public Subnets
# -------------------------

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.upscale_vpc.id
  cidr_block              = var.public_subnet_a_cidr
  availability_zone       = var.availability_zone_a
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.upscale_vpc.id
  cidr_block              = var.public_subnet_b_cidr
  availability_zone       = var.availability_zone_b
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-b"
  }
}

# -------------------------
# Private Application Subnets
# -------------------------

resource "aws_subnet" "private_app_a" {
  vpc_id            = aws_vpc.upscale_vpc.id
  cidr_block        = var.private_app_subnet_a_cidr
  availability_zone = var.availability_zone_a

  tags = {
    Name = "private-app-a"
  }
}

resource "aws_subnet" "private_app_b" {
  vpc_id            = aws_vpc.upscale_vpc.id
  cidr_block        = var.private_app_subnet_b_cidr
  availability_zone = var.availability_zone_b

  tags = {
    Name = "private-app-b"
  }
}

# -------------------------
# Private Database Subnets
# -------------------------

resource "aws_subnet" "private_db_a" {
  vpc_id            = aws_vpc.upscale_vpc.id
  cidr_block        = var.private_db_subnet_a_cidr
  availability_zone = var.availability_zone_a

  tags = {
    Name = "private-db-a"
  }
}

resource "aws_subnet" "private_db_b" {
  vpc_id            = aws_vpc.upscale_vpc.id
  cidr_block        = var.private_db_subnet_b_cidr
  availability_zone = var.availability_zone_b

  tags = {
    Name = "private-db-b"
  }
}

# -------------------------
# Elastic IP for NAT Gateway
# -------------------------

resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "upscale-nat-eip"
  }
}

# -------------------------
# NAT Gateway
# -------------------------

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_a.id

  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "upscale-nat-gateway"
  }
}

# -------------------------
# Public Route Table
# -------------------------

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.upscale_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_a_assoc" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_b_assoc" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public_rt.id
}

# -------------------------
# Private Route Table
# -------------------------

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.upscale_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private-route-table"
  }
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