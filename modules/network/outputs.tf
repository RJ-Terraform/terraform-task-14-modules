output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "Subnet IDs"
  value       = [for s in aws_subnet.public : s.id]
}