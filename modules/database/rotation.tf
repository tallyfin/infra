resource "aws_secretsmanager_secret_rotation" "master" {
  count = var.rotation_lambda_arn == null ? 0 : 1

  secret_id           = aws_secretsmanager_secret.master.id
  rotation_lambda_arn = var.rotation_lambda_arn

  rotation_rules {
    automatically_after_days = var.rotation_days
  }
}

resource "aws_lambda_permission" "rotation" {
  count = var.rotation_lambda_arn == null ? 0 : 1

  statement_id  = "AllowSecretsManagerRotation"
  action        = "lambda:InvokeFunction"
  function_name = var.rotation_lambda_arn
  principal     = "secretsmanager.amazonaws.com"
  source_arn    = aws_secretsmanager_secret.master.arn
}
