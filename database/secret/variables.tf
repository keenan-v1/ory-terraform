variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "tfe_organization" {
  type        = string
  description = "Terraform Cloud organization"
  default     = "wantsmore-coffee"
}

variable "project_name" {
  type        = string
  description = "Project name"
  default     = "coffee"
}

variable "environment" {
  type        = string
  description = "The environment to use"
  default     = "dev"
}
