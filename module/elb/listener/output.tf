output "listener_arn" {
  description = "An output variable where arn of the LoadBalanacer Protocol listener will get stored."
  value       = length(var.lb_listener_ports) == length(var.listener_protocol) && var.lb_arn != null && var.lb_arn != "" ? aws_lb_listener.listener[*].arn : null
}
