output "alb_arn" {
  description = "An output variable which stores the ALB arn"
  value       = var.is_create_alb ? aws_lb.alb[0].arn : null
}

output "alb_dns" {
  description = "An output variable which stores the ALB DNS name"
  value       = var.is_create_alb ? aws_lb.alb[0].dns_name : null
}

output "load_balancer_arn_suffix" {
  value       = var.is_create_alb ? aws_lb.alb[0].arn_suffix : null
  
}
