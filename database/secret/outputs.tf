output "secret_name" {
  value = aws_secretsmanager_secret.db_password.name
}

output "secret_version" {
  value = aws_secretsmanager_secret_version.db_password.version_id
}

output "secret_arn" {
  value = aws_secretsmanager_secret.db_password.arn
}
