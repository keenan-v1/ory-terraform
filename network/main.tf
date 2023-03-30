module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "${var.project_name}-${var.environment}-ory-vpc"
  cidr = "10.0.0.0/16"

  azs              = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets   = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  database_subnets = ["10.0.111.0/24", "10.0.112.0/24", "10.0.113.0/24"]

  database_subnet_group_name = "${var.project_name}-${var.environment}-ory-database-subnet-group"

  enable_ipv6 = true

  public_subnet_tags = {
    Name  = "${var.project_name}-${var.environment}-ory-public-subnet"
    Usage = "public"
  }

  private_subnet_tags = {
    Name  = "${var.project_name}-${var.environment}-ory-private-subnet"
    Usage = "private"
  }

  vpc_tags = {
    Name = "${var.project_name}-${var.environment}-ory-vpc"
  }

  database_subnet_tags = {
    Name  = "${var.project_name}-${var.environment}-ory-database-subnet"
    Usage = "database"
  }
}
