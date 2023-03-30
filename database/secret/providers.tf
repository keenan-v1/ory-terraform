terraform {
  cloud {
    organization = "wantsmore-coffee"

    workspaces {
      name = "ory-database-secret"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.50.0"
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project      = var.project_name
      ManagedBy    = "Terraform Cloud"
      Organization = var.tfe_organization
      Environment  = var.environment
      Workspace    = terraform.workspace
    }
  }
}
