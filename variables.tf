variable "region" {
  type        = string
  description = "AWS region"
}

variable "name_prefix" {
  type        = string
  description = "Prefix for resource names"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
}

variable "public_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))

  description = "Public subnets keyed by suffix (a, b, c)"
}

variable "allowed_ip_range" {
  type        = list(string)
  description = "Allowed ingress CIDRs"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}