output "lb_dns_name" {
  description = "ALB DNS name"
  value       = module.application.lb_dns_name
}