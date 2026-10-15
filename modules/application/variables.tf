variable "name_prefix" {
  type        = string
  description = "Prefix for resource names"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs"
}

variable "ssh_sg_id" {
  type        = string
  description = "Security group ID for SSH access"
}

variable "public_http_sg_id" {
  type        = string
  description = "Security group ID for public HTTP access"
}

variable "private_http_sg_id" {
  type        = string
  description = "Security group ID for private HTTP access"
}