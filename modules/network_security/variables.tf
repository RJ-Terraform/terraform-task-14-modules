variable "allowed_ip_range" {
  type        = list(string)
  description = "Allowed ingress CIDRs"
}

variable "name_prefix" {
  type        = string
  description = "Prefix for resource names"
}


variable "vpc_id" {
  type        = string
  description = "VPC ID"
}