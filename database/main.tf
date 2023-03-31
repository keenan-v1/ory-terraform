data "tfe_outputs" "database_secret" {
  organization = var.tfe_organization
  workspace    = "ory-database-secret"
}

data "tfe_outputs" "network" {
  organization = var.tfe_organization
  workspace    = "ory-network"
}

data "aws_secretsmanager_secret_version" "database_password" {
  secret_id  = data.tfe_outputs.database_secret.values["secret_name"]
  version_id = data.tfe_outputs.database_secret.values["secret_version"]
}

resource "aws_security_group" "database" {
  name        = "${var.project_name}-ory-database-sg"
  description = "${title(var.project_name)} Ory Database Security Group"
  vpc_id      = data.tfe_outputs.network.values["vpc_id"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_vpc_security_group_egress_rule" "database_egress_ipv4" {
  security_group_id = aws_security_group.database.id
  description       = "Allow all outbound IPv4 traffic"
  ip_protocol       = "all"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "database_egress_ipv6" {
  security_group_id = aws_security_group.database.id
  description       = "Allow all outbound IPv6 traffic"
  ip_protocol       = "all"
  cidr_ipv6         = "::/0"
}

resource "aws_db_instance" "database" {
  db_name               = "ory"
  identifier_prefix     = "${var.project_name}-${var.environment}-ory-"
  engine                = "mysql"
  engine_version        = "8.0"
  instance_class        = var.db_instance_type
  username              = "ory"
  password              = data.aws_secretsmanager_secret_version.database_password.secret_string
  publicly_accessible   = false
  storage_type          = "gp2"
  storage_encrypted     = true
  allocated_storage     = 5
  max_allocated_storage = 10
  skip_final_snapshot   = true
  db_subnet_group_name  = data.tfe_outputs.network.values["database_subnet_group_name"]
  vpc_security_group_ids = [
    aws_security_group.database.id,
  ]
}
