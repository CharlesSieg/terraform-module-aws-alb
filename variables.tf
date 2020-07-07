variable "app_name" {
  description = "application name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "ingress_cidr_block" {
  description = "The CIDR block on which to allow ingress."
  type        = string
}

variable "logs_bucket" {
  description = "S3 bucket which holds the ALB logs."
  type        = string
}

variable "public_subnets" {
  description = "Public subnets"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}
