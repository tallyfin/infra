output "endpoint" {
  value = aws_db_instance.this.endpoint
}

output "credentials_secret_arn" {
  value = aws_secretsmanager_secret.master.arn
}
