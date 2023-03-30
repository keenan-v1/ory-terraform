output "database_name" {
  value       = aws_db_instance.database.db_name
  description = "Value of the database name"
}

output "database_security_group_id" {
  value       = aws_security_group.database.id
  description = "Value of the database security group ID"
}

output "database_identifier" {
  value       = aws_db_instance.database.identifier
  description = "Value of the database identifier"
}

output "database_host" {
  value       = aws_db_instance.database.address
  description = "Value of the database host"
}

output "database_port" {
  value       = aws_db_instance.database.port
  description = "Value of the database port"
}
