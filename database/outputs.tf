output "db_name" {
  value       = aws_db_instance.database.db_name
  description = "Value of the database name"
}

output "database_sg" {
  value       = aws_security_group.database.id
  description = "Value of the database security group ID"
}

output "db_identifier" {
  value       = aws_db_instance.database.identifier
  description = "Value of the database identifier"
}
