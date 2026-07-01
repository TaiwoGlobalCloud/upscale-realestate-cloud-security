####################################################
# Generate Database Password
####################################################

resource "random_password" "db_password" {

  length  = 24
  special = true
}

####################################################
# AWS Secrets Manager Secret
####################################################

resource "aws_secretsmanager_secret" "db_credentials" {

  name = "${var.project_name}-db-credentials"

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-db-secret"
    }
  )
}

####################################################
# Store Credentials in Secrets Manager
####################################################

resource "aws_secretsmanager_secret_version" "db_credentials" {

  secret_id = aws_secretsmanager_secret.db_credentials.id

  secret_string = jsonencode({
    username = var.db_username
    password = random_password.db_password.result
  })
}

####################################################
# Database Subnet Group
####################################################

resource "aws_db_subnet_group" "postgres" {

  name = "${var.project_name}-db-subnet-group"

  subnet_ids = var.private_db_subnet_ids

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-db-subnet-group"
    }
  )
}

####################################################
# PostgreSQL Database
####################################################

resource "aws_db_instance" "postgres" {

  identifier = "${var.project_name}-postgres"

  engine         = "postgres"
  engine_version = var.engine_version

  instance_class = var.instance_class

  allocated_storage = var.allocated_storage
  storage_type      = "gp3"

  ##################################################
  # Encryption
  ##################################################

  storage_encrypted = true
  kms_key_id        = var.kms_key_arn

  ##################################################
  # Database Configuration
  ##################################################

  db_name  = var.db_name
  username = var.db_username
  password = random_password.db_password.result

  ##################################################
  # Networking
  ##################################################

  db_subnet_group_name = aws_db_subnet_group.postgres.name

  vpc_security_group_ids = [
    var.db_security_group_id
  ]

  publicly_accessible = false

  ##################################################
  # Backup & Availability
  ##################################################

  backup_retention_period = 7
  skip_final_snapshot     = true
  multi_az                = var.multi_az
  deletion_protection     = false

  ##################################################
  # Tags
  ##################################################

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-postgres"
    }
  )
}