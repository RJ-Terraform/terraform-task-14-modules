output "ssh_sg_id" {
  value       = aws_security_group.ssh.id
  description = "Security group ID for SSH access"
}

output "public_http_sg_id" {
  value       = aws_security_group.public_http.id
  description = "Security group ID for public HTTP access"
}

output "private_http_sg_id" {
  value       = aws_security_group.private_http.id
  description = "Security group ID for private HTTP access"
}