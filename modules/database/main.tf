resource "aws_db_subnet_group" "this" {
  name       = var.name
  subnet_ids = var.subnet_ids
}

resource "random_password" "master" {
  length  = 32
  special = false
}

resource "aws_secretsmanager_secret" "master" {
  name = "${var.name}/master-credentials"
}

resource "aws_secretsmanager_secret_version" "master" {
  secret_id = aws_secretsmanager_secret.master.id
  secret_string = jsonencode({
    username = "tallyfin"
    password = random_password.master.result
  })
}

resource "aws_db_instance" "this" {
  identifier              = var.name
  engine                  = "postgres"
  engine_version          = "16.4"
  instance_class          = var.instance_class
  allocated_storage       = 100
  storage_encrypted       = true
  db_subnet_group_name    = aws_db_subnet_group.this.name
  username                = "tallyfin"
  password                = random_password.master.result
  backup_retention_period = 14
  deletion_protection     = true
  skip_final_snapshot     = false
}
