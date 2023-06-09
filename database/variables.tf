variable "region" {
  type        = string
  description = "The AWS region to use"
  default     = "us-east-1"
}

variable "tfe_organization" {
  type        = string
  description = "The Terraform Cloud organization to use"
  default     = "wantsmore-coffee"
}

variable "project_name" {
  type        = string
  description = "The name of the project"
  default     = "coffee"
}

variable "environment" {
  type        = string
  description = "The environment to use"
  default     = "dev"
}

variable "db_instance_type" {
  type        = string
  description = "The type of database instance to use"
  default     = "db.t4g.micro"
}

variable "repository" {
  type        = string
  description = "The name of the repository"
  default     = "https://github.com/keenan-v1/ory-terraform"
}
