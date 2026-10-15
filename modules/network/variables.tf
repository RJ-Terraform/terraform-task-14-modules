
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