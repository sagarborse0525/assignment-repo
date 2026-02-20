output "alb_group_arn" {
  description = "An output variable where arn of the LoadBalanacer Group will get stored."
  value       = var.is_alb_tg_enabled ? aws_lb_target_group.alb_target_group[0].arn : null
}

output "target_group_arn_suffix" {
  description = "An output variable where arn of the LoadBalanacer Group will get stored."
  value       = var.is_alb_tg_enabled ? aws_lb_target_group.alb_target_group[0].arn_suffix : null
}